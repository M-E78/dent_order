class OpenaiParserService
  def initialize(text)
    @text = text
    @client = OpenAI::Client.new
  end

  def parse
    # プロンプトの定義（ルールを整理し、臨床知識を強化）
    prompt = <<~TEXT
      あなたはプロの歯科医療アシスタントです。
      以下の音声認識テキストから「歯番号」「状態」「製作物」「シェード」「ポンティック形態」を抽出してください。

      【入力】
      "#{@text}"

      【抽出ルール（歯科特有の表現に注意）】
      1. FDI方式（11-18, 21-28, 31-38, 41-48）で歯番を特定せよ。
      2. 「右上654」のように連続する数字は「右上6」「右上5」「右上4」と解釈せよ。
      3. ⚠️正中またぎ：「321123」や「2112」は正中をまたぐ指定。「上」は右上・左上、「下」は右下・左下として展開せよ。
      4. ⚠️FDI混同注意：「321」の「3」などをFDIの30番台と勘違いしないこと。
      5. 歯の状態を [normal, pontic] から選択せよ。
      6. ポンティックの部分指定：一部だけがポンティックと指定された場合、その歯のみponticとし、残りはnormalとせよ。
      7. ⚠️製作物の正規化：音声内の製作物は、必ず以下の【システム登録名称】のいずれかに変換せよ。
         【システム登録名称】: FMC, インレー, CAD/CAM冠, CAD/CAMインレー, e.maxインレー, e.maxブリッジ, zirインレー, zir Crブリッジ, PFMブリッジ, 保険ブリッジ, TEC, メタルコア, ファイバーコア, IP上部構造(MZC), IP上部構造(PFZ), PFZ, PFZブリッジ
         ※「インプラント」という発話は「IP」として解釈せよ。
      8. ⚠️臨床的な制約（超重要）：「状態」の中に1つでも『pontic』が存在する場合、製作物は必ず名前に「ブリッジ」が含まれるもの、または「TEC」から選択せよ。（例：音声が「e.max」であっても、ポンティックがあれば「e.maxインレー」ではなく「e.maxブリッジ」を選択すること）
      9. シェードとポンティック形態の分離抽出：
         ・色（A3, A3.5, A2など）は `shade` として抽出せよ。
         ・ポンティックの形（船底型, 離底型, オベイト, リッジラップ）は `pontic_form` として抽出せよ。
      10. 必ずJSONオブジェクト形式で出力せよ。余計な挨拶や解説は一切含めないこと。

      【出力フォーマット例】
      {
        "teeth": [{"fdi": "13", "type": "normal"}, {"fdi": "12", "type": "pontic"}, {"fdi": "11", "type": "pontic"}],
        "product": "保険ブリッジ",
        "shade": "A3",
        "pontic_form": "船底型"
      }
    TEXT

    response = @client.chat(
      parameters: {
        model: "gpt-4o",
        response_format: { type: "json_object" },
        messages: [ { role: "user", content: prompt } ],
        temperature: 0
      }
    )

    raw_content = response.dig("choices", 0, "message", "content")
    Rails.logger.info "🗣️ AIの生テキスト: #{raw_content}"

    parsed_data = JSON.parse(raw_content)
    parsed_data # ハッシュ全体（teeth, product, shade, pontic_form）を返す

  rescue => e
    Rails.logger.error "🚨 AI解析エラー: #{e.message}"
    # エラー時は空の構造を返してJS側でのクラッシュを防ぐ
    { "teeth" => [], "product" => nil, "shade" => nil, "pontic_form" => nil }
  end
end
