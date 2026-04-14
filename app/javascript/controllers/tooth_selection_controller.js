import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "ur", "ul", "ll", "lr"]

  connect() {
    this.selectedTeeth = new Set();
    this.ponticTeeth = new Set(); // 🌟 ポンティック専用の記憶箱

    // 編集画面などで既存のデータ（11, 12(P)など）がある場合の読み込み処理
    if (this.inputTarget.value) {
      const savedTeeth = this.inputTarget.value.split(",").filter(n => n);
      savedTeeth.forEach(tooth => {
        if (tooth.includes("(P)")) {
          this.ponticTeeth.add(tooth.replace("(P)", ""));
        } else {
          this.selectedTeeth.add(tooth);
        }
      });
    }

    const paths = this.element.querySelectorAll('path[class*="tooth-"]');
    paths.forEach(path => {
      const match = path.className.baseVal.match(/tooth-(\d{2})/);
      if (match) {
        path.dataset.fdi = match[1];
        path.dataset.action = "click->tooth-selection#toggle";
        path.style.cursor = "pointer";
        path.classList.add("transition-all", "duration-200");
      }
    });

    this.refreshStyles();
  }

  toggle(event) {
    const fdi = event.currentTarget.dataset.fdi;
    
    // 🌟 右側のチェックボックスから「ブリッジ」または「IP」が選ばれているか確認
    const checkboxes = document.querySelectorAll('input[name="lab_order[prosthesis_types][]"]:checked');
    const isBridgeMode = Array.from(checkboxes).some(cb => 
      cb.value.includes('ブリッジ') || cb.value.includes('IP')
    );

    if (isBridgeMode) {
      // 🌟 ブリッジモード：3状態ループ (白 -> 青 -> オレンジ -> 白)
      if (!this.selectedTeeth.has(fdi) && !this.ponticTeeth.has(fdi)) {
        this.selectedTeeth.add(fdi); // 1回目: 支台歯
      } else if (this.selectedTeeth.has(fdi)) {
        this.selectedTeeth.delete(fdi);
        this.ponticTeeth.add(fdi);    // 2回目: ポンティック
      } else {
        this.ponticTeeth.delete(fdi); // 3回目: クリア
      }
    } else {
      // 🌟 通常モード：2状態 (白 <-> 青)
      if (this.ponticTeeth.has(fdi)) this.ponticTeeth.delete(fdi);
      
      if (this.selectedTeeth.has(fdi)) {
        this.selectedTeeth.delete(fdi);
      } else {
        this.selectedTeeth.add(fdi);
      }
    }
    
    this.updateInputAndSummary();
  }

  // 🌟 上顎をすべて選択
  selectUpper() {
    const upperFdis = ["11","12","13","14","15","16","17","18", "21","22","23","24","25","26","27","28"];
    upperFdis.forEach(fdi => this.selectedTeeth.add(fdi));
    this.ponticTeeth.clear(); // 全顎選択時はポンティックをリセット
    this.updateInputAndSummary();
  }

  // 🌟 下顎をすべて選択
  selectLower() {
    const lowerFdis = ["31","32","33","34","35","36","37","38", "41","42","43","44","45","46","47","48"];
    lowerFdis.forEach(fdi => this.selectedTeeth.add(fdi));
    this.ponticTeeth.clear();
    this.updateInputAndSummary();
  }

  clearAll() {
    this.selectedTeeth.clear();
    this.ponticTeeth.clear();
    this.updateInputAndSummary();
  }

  updateInputAndSummary() {
    // 🌟 送信用データの作成 (11, 12(P), 13 のような形に合体)
    const allSelected = [];
    this.selectedTeeth.forEach(fdi => allSelected.push(fdi));
    this.ponticTeeth.forEach(fdi => allSelected.push(`${fdi}(P)`));
    this.inputTarget.value = allSelected.join(",");

    this.refreshStyles();
  }

  refreshStyles() {
    const paths = this.element.querySelectorAll('path[data-fdi]');
    paths.forEach(path => {
      const fdi = path.dataset.fdi;
      if (this.ponticTeeth.has(fdi)) {
        // 🌟 ポンティック色 (オレンジ)
        path.style.fill = "#ffedd5";
        path.style.stroke = "#ea580c"; 
        path.style.strokeWidth = "2";
      } else if (this.selectedTeeth.has(fdi)) {
        // 🌟 支台歯色 (青)
        path.style.fill = "#dbeafe";
        path.style.stroke = "#2563eb"; 
        path.style.strokeWidth = "2";
      } else {
        // 未選択 (白)
        path.style.fill = "#ffffff";
        path.style.stroke = "#334155";
        path.style.strokeWidth = "1";
      }
    });

    // 🌟 十字サマリーの更新
    if (this.hasUrTarget) {
      const allSelected = this.inputTarget.value ? this.inputTarget.value.split(",") : [];
      
      const formatFdi = (arr, prefix, reverse = false) => {
        let filtered = arr.filter(n => n.startsWith(prefix));
        if (reverse) filtered = filtered.sort().reverse();
        else filtered = filtered.sort();
        
        // 🌟 最初の1文字(10の位)だけを削る（"12(P)" なら "2(P)" になる）
        return filtered.map(n => n.substring(1)).join(' ');
      };

      this.urTarget.textContent = formatFdi(allSelected, '1', true);
      this.ulTarget.textContent = formatFdi(allSelected, '2', false);
      this.lrTarget.textContent = formatFdi(allSelected, '4', true);
      this.llTarget.textContent = formatFdi(allSelected, '3', false);
    }
  }
}