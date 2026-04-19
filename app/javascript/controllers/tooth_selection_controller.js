import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "ur", "ul", "ll", "lr"]

  connect() {
    // 🌟 AIからの結果通知を受け取る耳を作る
    window.addEventListener("voice-result", (event) => {
      this.applyVoiceResults(event.detail.results)
    })

    this.selectedTeeth = new Set();
    this.ponticTeeth = new Set();

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

  // AIの結果を反映
  // AIの結果を反映
  applyVoiceResults(data) {
    console.log("歯式図に反映中...", data)

    // 1. 歯の選択をリセット
    this.clearAll();

    // 2. チェックボックスのリセット
    document.querySelectorAll('input[type="checkbox"], input[type="radio"]').forEach((input) => {
      input.checked = false;
    });

    // 🌟 【新規】プルダウン（セレクトボックス）のリセット
    document.querySelectorAll('select').forEach((select) => {
      select.value = "指定なし"; // 初期値に戻す
    });

    // 🌟🌟🌟 復活させた「歯を塗る処理」 🌟🌟🌟
    const teethList = Array.isArray(data) ? data : (data.teeth || []);
    teethList.forEach(item => {
      const fdi = String(item.fdi)
      if (item.type === "pontic") {
        this.ponticTeeth.add(fdi)
      } else {
        this.selectedTeeth.add(fdi)
      }
    })
    this.updateInputAndSummary();
    // 🌟🌟🌟 復活ここまで 🌟🌟🌟

    // 3. 製作物（チェックボックス）の選択
    if (data.product) {
      this.selectProduct(data.product)
    }

    // 🌟 【新規】シェード（プルダウン）の選択
    if (data.shade) {
      // name属性に 'shade' が含まれるselectタグを探す
      const shadeSelect = document.querySelector('select[name*="[shade]"]')
      if (shadeSelect) {
        shadeSelect.value = data.shade
        console.log(`✅ シェードを ${data.shade} に設定しました`)
      }
    }

    // 🌟 【新規】ポンティック形態（プルダウン）の選択
    if (data.pontic_form) {
      // name属性に 'pontic_form' が含まれるselectタグを探す
      const ponticSelect = document.querySelector('select[name*="[pontic_form]"]')
      if (ponticSelect) {
        ponticSelect.value = data.pontic_form
        console.log(`✅ ポンティック形態を ${data.pontic_form} に設定しました`)
      }
    }
  }

  // 🌟 超強力版：製作物（FMCなど）のチェックを入れるメソッド
  selectProduct(productName) {
    console.log(`🔍 製作物「${productName}」を探しています...`)

    // 作戦1：チェックボックスの value 自体に "FMC" などが入っているか探す
    const inputs = Array.from(document.querySelectorAll('input[type="checkbox"]'))
    const targetInput = inputs.find(input => input.value === productName)

    if (targetInput) {
      targetInput.checked = true
      console.log("✅ [作戦1成功] valueが一致するチェックボックスを見つけました！")
      return // 見つけたらここで終了
    }

    // 作戦2：画面のラベルの文字（FMCなど）を探す
    const labels = Array.from(document.querySelectorAll('label'))
    const targetLabel = labels.find(label => label.textContent.trim().includes(productName))

    if (targetLabel) {
      // パターンA： labelの for 属性でIDが指定されている場合
      const checkboxId = targetLabel.getAttribute('for')
      if (checkboxId) {
        const checkbox = document.getElementById(checkboxId)
        if (checkbox) {
          checkbox.checked = true
          console.log("✅ [作戦2-A成功] labelのfor属性から見つけました！")
          return
        }
      }

      // パターンB： labelの中にinputタグが包まれている場合（<label><input>FMC</label>）
      const nestedCheckbox = targetLabel.querySelector('input[type="checkbox"]')
      if (nestedCheckbox) {
        nestedCheckbox.checked = true
        console.log("✅ [作戦2-B成功] labelの中にあるチェックボックスを見つけました！")
        return
      }
    }

    // どこを探しても見つからなかった場合
    console.warn(`❌ 画面上に「${productName}」というチェックボックスが見つかりませんでした。`)
  }

  toggle(event) {
    const fdi = event.currentTarget.dataset.fdi;
    const checkboxes = document.querySelectorAll('input[name="lab_order[prosthesis_types][]"]:checked');
    const isBridgeMode = Array.from(checkboxes).some(cb => 
      cb.value.includes('ブリッジ') || cb.value.includes('IP')
    );

    if (isBridgeMode) {
      if (!this.selectedTeeth.has(fdi) && !this.ponticTeeth.has(fdi)) {
        this.selectedTeeth.add(fdi);
      } else if (this.selectedTeeth.has(fdi)) {
        this.selectedTeeth.delete(fdi);
        this.ponticTeeth.add(fdi);
      } else {
        this.ponticTeeth.delete(fdi);
      }
    } else {
      if (this.ponticTeeth.has(fdi)) this.ponticTeeth.delete(fdi);
      if (this.selectedTeeth.has(fdi)) {
        this.selectedTeeth.delete(fdi);
      } else {
        this.selectedTeeth.add(fdi);
      }
    }
    this.updateInputAndSummary();
  }

  selectUpper() {
    const upperFdis = ["11","12","13","14","15","16","17","18", "21","22","23","24","25","26","27","28"];
    upperFdis.forEach(fdi => this.selectedTeeth.add(fdi));
    this.ponticTeeth.clear();
    this.updateInputAndSummary();
  }

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
        path.style.fill = "#ffedd5";
        path.style.stroke = "#ea580c"; 
        path.style.strokeWidth = "2";
      } else if (this.selectedTeeth.has(fdi)) {
        path.style.fill = "#dbeafe";
        path.style.stroke = "#2563eb"; 
        path.style.strokeWidth = "2";
      } else {
        path.style.fill = "#ffffff";
        path.style.stroke = "#334155";
        path.style.strokeWidth = "1";
      }
    });

    if (this.hasUrTarget) {
      const allSelected = this.inputTarget.value ? this.inputTarget.value.split(",") : [];
      const formatFdi = (arr, prefix, reverse = false) => {
        let filtered = arr.filter(n => n.startsWith(prefix));
        if (reverse) filtered = filtered.sort().reverse();
        else filtered = filtered.sort();
        return filtered.map(n => n.substring(1)).join(' ');
      };
      this.urTarget.textContent = formatFdi(allSelected, '1', true);
      this.ulTarget.textContent = formatFdi(allSelected, '2', false);
      this.lrTarget.textContent = formatFdi(allSelected, '4', true);
      this.llTarget.textContent = formatFdi(allSelected, '3', false);
    }
  }
}