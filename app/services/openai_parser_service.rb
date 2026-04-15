class OpenaiParserService
  def initialize(text)
    @text = text
    @client = OpenAI::Client.new
  end

  def parse
    prompt = <<~TEXT
      あなたはプロの歯科医療アシスタントです。
      以下の音声認識テキストから「歯番号」と「状態」を抽出してください。

      【入力】
      "#{@text}"

      【抽出ルール】
      1. FDI方式（11-18, 21-28, 31-38, 41-48）で歯番を特定せよ。
      2. 「右上654」のように数字が連続している場合は、「右上6」「右上5」「右上4」と解釈して変換せよ。
      3. 状態を [normal, pontic] から選択せよ。（「ポンティック」「ダミー」「欠損」などの言葉があれば pontic、それ以外は normal）
      4. 必ずJSONオブジェクト形式で出力せよ。ルートのキーは "teeth" とすること。余計な挨拶や解説は一切含めないこと。

      【出力フォーマット】
      {
        "teeth": [
          {"fdi": "16", "type": "normal"},
          {"fdi": "15", "type": "pontic"}
        ]
      }
    TEXT

    response = @client.chat(
      parameters: {
        model: "gpt-4o",
        response_format: { type: "json_object" }, # 🌟 ココが最強の魔法！「JSON以外喋るな」という強制命令
        messages: [{ role: "user", content: prompt }],
        temperature: 0
      }
    )

    # AIの返答を受け取る
    raw_content = response.dig("choices", 0, "message", "content")
    Rails.logger.info "🗣️ AIの生テキスト: #{raw_content}"

    # 文字列をRubyのデータに変換し、"teeth" の中身の配列だけを取り出す
    parsed_data = JSON.parse(raw_content)
    parsed_data["teeth"] || []

  rescue => e
    Rails.logger.error "🚨 AI解析エラー: #{e.message}"
    Rails.logger.error "🚨 パース失敗テキスト: #{raw_content}"
    []
  end
end