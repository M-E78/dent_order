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

  // 🌟 AIの結果を反映（ここにカッコのエラーがありました）
  applyVoiceResults(results) {
    console.log("歯式図に反映中...", results)
    results.forEach(item => {
      const fdi = String(item.fdi)
      const type = item.type // "normal" or "pontic"
      if (type === "pontic") {
        this.selectedTeeth.delete(fdi)
        this.ponticTeeth.add(fdi)
      } else {
        this.ponticTeeth.delete(fdi)
        this.selectedTeeth.add(fdi)
      }
    })
    this.updateInputAndSummary();
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