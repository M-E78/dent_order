import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // HTML側で data-dropdown-target="menu" と書いた要素を操作できるようにします
  static targets = ["menu"]

  connect() {
    console.log("Dropdown controller connected")
  }

  // ボタンを押した時に実行される
  toggle() {
    // hidden クラス（非表示）を付けたり消したりする
    this.menuTarget.classList.toggle("hidden")
  }

  // メニューの外側をクリックした時に閉じる処理
  close(event) {
    // クリックされた場所が、このコントローラーの範囲外なら hidden を追加して隠す
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.add("hidden")
    }
  }
}