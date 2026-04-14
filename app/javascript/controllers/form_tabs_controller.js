import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tab", "panel"]

  switch(event) {
    const selectedTabName = event.currentTarget.dataset.tabName

    // 1. パネルの表示・非表示を切り替え
    this.panelTargets.forEach(panel => {
      if (panel.dataset.panelName === selectedTabName) {
        panel.classList.remove("hidden")
        panel.classList.add("block")
      } else {
        panel.classList.add("hidden")
        panel.classList.remove("block")
      }
    })

    // 2. タブボタンの色（アクティブ状態）を切り替え
    this.tabTargets.forEach(tab => {
      if (tab.dataset.tabName === selectedTabName) {
        // アクティブなタブのデザイン
        tab.classList.add("bg-white", "text-blue-600", "shadow-sm")
        tab.classList.remove("text-slate-500", "hover:text-slate-700")
      } else {
        // 非アクティブなタブのデザイン
        tab.classList.remove("bg-white", "text-blue-600", "shadow-sm")
        tab.classList.add("text-slate-500", "hover:text-slate-700")
      }
    })
  }
}