import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["status"]

  connect() {
    console.log("音声認識コントローラーが接続されました！"); // 🌟 これを追加
    // ブラウザが音声認識に対応しているかチェック
    const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition
    if (SpeechRecognition) {
      this.recognition = new SpeechRecognition()
      this.recognition.lang = 'ja-JP'
      this.recognition.interimResults = false // 確定した結果だけ受け取る

      // 音声認識が終了した時の処理
      this.recognition.onresult = (event) => {
        const text = event.results[0][0].transcript
        console.log("聞き取り結果:", text)
        this.analyzeWithAI(text)
      }

      this.recognition.onend = () => {
        this.updateStatus("待機中")
      }
    } else {
      console.error("このブラウザは音声認識に対応していません。")
    }
  }

  // マイクボタンが押された時のアクション
  start() {
    this.recognition.start()
    this.updateStatus("聞き取り中...")
  }

  // 🌟 RailsのAIエンドポイントにテキストを送る
  async analyzeWithAI(text) {
    this.updateStatus("AI解析中...")
    
    try {
      const response = await fetch("/lab_orders/analyze_voice", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
        },
        body: JSON.stringify({ text: text })
      })

      const data = await response.json()
      console.log("AI解析結果:", data)

      // 🌟 解析結果を「歯式コントローラー」に伝える
      this.dispatchResultToToothSelection(data)

    } catch (error) {
      console.error("AI解析エラー:", error)
      this.updateStatus("エラー発生")
    }
  }

  // 🌟 別のコントローラー（tooth-selection）へイベントを飛ばす魔法
  dispatchResultToToothSelection(results) {
    // カスタムイベントを発火させる
    const event = new CustomEvent("voice-result", { detail: { results: results } })
    window.dispatchEvent(event)
    this.updateStatus("反映完了！")
  }

  updateStatus(message) {
    if (this.hasStatusTarget) {
      this.statusTarget.textContent = message
    }
  }
}