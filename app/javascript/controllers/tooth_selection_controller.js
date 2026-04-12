import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "ur", "ul", "ll", "lr"]

  connect() {
    // 🌟 リロードした時に、このJSがちゃんと読み込まれているか報告させます
    console.log("🦷 Tooth Selection Controller が最新版で起動しました！");
    
    this.selectedTeeth = new Set();
    if (this.inputTarget.value) {
      this.selectedTeeth = new Set(this.inputTarget.value.split(",").filter(n => n));
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
    if (this.selectedTeeth.has(fdi)) {
      this.selectedTeeth.delete(fdi);
    } else {
      this.selectedTeeth.add(fdi);
    }
    this.inputTarget.value = Array.from(this.selectedTeeth).join(",");
    this.refreshStyles();
  }

  refreshStyles() {
    const paths = this.element.querySelectorAll('path[data-fdi]');
    paths.forEach(path => {
      const fdi = path.dataset.fdi;
      if (this.selectedTeeth.has(fdi)) {
        path.style.fill = "#dbeafe";
        path.style.stroke = "#2563eb"; 
        path.style.strokeWidth = "2";
      } else {
        path.style.fill = "#ffffff";
        path.style.stroke = "#334155";
        path.style.strokeWidth = "1";
      }
    });

    const selectedArray = Array.from(this.selectedTeeth);
    console.log("👇 現在選択されている歯:", selectedArray);

    // 🌟 十字サマリーの更新（ターゲットが見つかるかどうかも報告させます）
    if (this.hasUrTarget) {
      // .map(n => n[1]) を追加して、10の位を削ぎ落とします
      this.urTarget.textContent = selectedArray.filter(n => n.startsWith('1')).sort().reverse().map(n => n[1]).join(' ');
      this.ulTarget.textContent = selectedArray.filter(n => n.startsWith('2')).sort().map(n => n[1]).join(' ');
      this.lrTarget.textContent = selectedArray.filter(n => n.startsWith('4')).sort().reverse().map(n => n[1]).join(' ');
      this.llTarget.textContent = selectedArray.filter(n => n.startsWith('3')).sort().map(n => n[1]).join(' ');
      console.log("✅ 十字サマリーの更新に成功しました（1桁表示版）！");
    } else {
      console.error("❌ エラー: 十字サマリーの枠（Target）が見つかりません！");
    }
  }
}