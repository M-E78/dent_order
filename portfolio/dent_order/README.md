現役の歯科技工士として、歯科業界の『情報の非対称性』と『入力コスト』をITで解決することが本プロジェクトの至上命題です。

## サービス概要

歯科医院向けの「患者・技工物の紐付け管理」および「デジタル技工指示書」アプリです。
インターネットを通じて、どのデバイスからも即座に装着された技工物を確認できます。
現場の負担を減らす「爆速かつシンプル」な操作性で、歯科医院と歯科技工所の連携を最適化します。

## このサービスへの思い・作りたい理由

私は現役の歯科技工士として日々の業務に従事していますが、歯科医院から届く技工指示書の記載不備により、製作がストップしてしまうケースを数多く経験してきました。
不十分な指示書は、歯科医院・歯科技工所双方に「再確認」という余計なコストを発生させます。現場の技工士にとって、的確な指示のもとで製作に集中できる環境を整えることは、作業時間の確保だけでなく、心理的ストレスの劇的な解消に繋がると確信しています。
また、現場では患者様の過去の治療部位や装着された技工物の情報が即座に参照できず、次の方針決定に時間を要する場面にも直面してきました。
「現場の負担を最小限にし、歯科医療に関わるすべての人が本来の業務にスムーズに従事できる環境を作りたい」という強い思いから、このアプリの開発を決意しました。

## 法規への適合性と設計思想

厚生労働省の「医療情報システムの安全管理に関するガイドライン」に基づき、以下の通り設計方針を定義しています。

### 1. 医療情報の共有および保存
本アプリは、歯科技工士法第21条に定められた「指示書の2年間保存義務」をサポートします。
- **技術的アプローチ**: 「見読性」と「保存性」を担保するため、PDF出力機能および閲覧機能を実装。
- **責任分界点**: システムは法的根拠を満たすツールを提供し、実際の保存・運用管理はユーザー（医療機関・歯科技工所）が担うものと定義します。

### 2. 真正性の担保（なりすまし・改ざん防止）
実務上、入力作業をスタッフが代行するケースを考慮し、以下の設計を採用します。
- **認証とログ**: ログイン認証による本人確認と「いつ、誰が承認したか」の作成ログを記録。
- **責任の所在**: すべての操作責任は、認証された担当歯科医師に紐付く設計とし、真正性を確保します。

## ユーザー層について

歯科技工物の指示書を発行するのは歯科医院であると法律で決まっているため、基本的には歯科医院向けのアプリとして想定しています。
操作するのは歯科医師、歯科衛生士、歯科助手となり、閲覧可能なのは歯科技工所の歯科技工士となります。


## サービスの利用イメージ

・過去の治療部位や装着された技工物を即座に参照でき、再診時やメンテナンス時の判断を迅速化します。
・正確な製作指示により、歯科技工所との「言った・言わない」の齟齬をなくし、再製作のリスクを最小化します。
・月次・年次単位での製作実績を自動集計。従来の手書き管理や目視での集計コストを削減し、医院経営の分析に役立てることができます。

## ユーザーの獲得について

・マルチデバイス対応による、診療室からの即時アクセス
・歯科医院・歯科技工所間における「情報の非対称性」の解消、歯科技工所側の「確認コスト」を大幅に削減

## サービスの差別化ポイント・推しポイント

類似のWebアプリが存在することを確認したが、そのアプリは患者様の歯科技工物の情報登録までの手続きが複雑化している。
既存サービスは入力コストが高く、専任の技工士がいなければ運用が困難な現状がある。
本アプリは診療の合間に3分で入力を完了できるUI/UXを目指し、現場の属人化を解消する。
差別化ポイントとしては以下のとおり

・徹底したシンプルUI
　機能を削ぎ落とし、ITに詳しくないスタッフでも直感的に使えるUXを提供。

・ラボ・フレンドリー
　歯科技工所側の「確認コスト」を削減し、再製作のリスクを最小限に抑える。

## 機能候補

MVPリリース時の機能
・アカウント登録、ログイン・ログアウト機能
・患者様および歯科技工物（製作物、素材等の内容）の登録
・音声認識 × AIによる「指示書の自動構造化」

本リリース時の機能
・外部の歯科技工所とのデータ共有・連携
・技工指示書のPDF出力機能

## 実装予定のデータ構造と具体的項目

本アプリは、現場の入力コストを最小限に抑えつつ、技工指示書として成立する「情報の網羅性」を担保するため、以下のデータ項目を定義しています。

### 専門用語の説明

* **技工物**
  - 差し歯や入れ歯のことを指す。
* **技工指示書**
  - エンジニアでいう「仕様書」。不備があると再製作が発生する。
* **歯科技工所**
  - 技工物を製作する外注先。
* **保険診療**
  - 健康保険を適用できる診療（3割負担）。
* **自由診療**
  - 健康保険が適用できない自費診療。セラミック、矯正治療、インプラントなどが該当。
* **コア**
  - 神経を抜いた歯に差し歯を被せるための「土台（中身）」。
* **仮歯**
  - 最終的なものが完成するまでの一時的な差し歯。
* **個人トレー**
  - 各患者様の口腔内に合わせて製作する「型取り用」の道具。
* **インレー / アンレー**
  - 部分的な「詰め物」。
* **FMC（フルメタルクラウン）**
  - 金属のみで製作された被せ物。
* **CAD/CAM冠 / インレー・アンレー**
  - デジタル加工機で削り出す、レジン（プラスチック）製の被せ物・詰め物。
* **前装冠（ぜんそうかん）**
  - 見える部分をレジンで白くした金属の被せ物。主に前歯で使用。
* **ブリッジ**
  - 欠損部の両隣を削って土台（支台歯）にし、橋を架けるように人工歯（ポンティック）を固定する手法。
* **e-max / ジルコニア**
  - 審美性と強度に優れたセラミック素材。
* **インプラント上部構造**
  - 埋入した人工歯根（インプラント）の上に装着する「歯」の部分。
* **レイヤリング**
  - 陶材を手作業で何層にも盛り重ね、天然歯のような複雑な色調と透明感を再現する技法。
* **シェード**
  - 製作する技工物の色の明るさの指標。
* **コンタクト**
  - 差し歯が両端の歯に接触していること。
* **対合**
  - 作る差し歯の反対側の歯のこと。下顎の差し歯を作る場合は対合は上顎。対合があることにより噛み合わせを確認できます。
* **バイト**
  - 差し歯が対合と噛んでいること。
* **マージン**
  - 自分の歯と詰め物や差し歯の境目のこと。


### 1. 患者・部位情報
- **患者氏名・患者管理番号**: 既存システム（カルテ等）との紐付け用。
- **治療部位**: 上顎/下顎、前歯/奥歯、単数/複数の選択。

### 2. 技工物・素材の選択肢（MVP範囲）
現場での需要と入力負荷を考慮し、MVPでは「差し歯・準備用」に特化。基本的にはプルダウン選択により3分以内の入力を実現します。

- **治療準備用**: コア、TEC（仮歯）、プロビジョナル、咬合床、個人トレー
- **保険診療（補綴）**: インレー/アンレー、FMC、CAD/CAMインレー/アンレー、CAD/CAM冠、前装冠、ブリッジ
- **自由診療（補綴）**: e-max、ジルコニア、インプラント上部構造

### 3. 指示書のセミオート作成
- **音声解析**: Web Speech APIによるリアルタイムテキスト化。
- **項目抽出テンプレート**: OpenAI APIを用い、非構造化テキストから「部位」「補綴物」「材料」「種別」等の重要項目を抽出。
- **自動補完**: 抽出データを登録フォームの各項目へ自動マッピング。

【導入の狙い】 歯科ドメインの入力項目は非常に複雑で、従来のプルダウン選択方式では「チェアタイム（診療時間）」を圧迫するという課題がありました。この機能をMVPとして実装することで、「思考を止めない、ハンズフリーな指示書作成」を実現し、既存サービスとの圧倒的な差別化を図ります。

将来的な展望：デジタル印象データ（STL）との連携
将来的な拡張として、口腔内スキャナから出力される3Dデータ（STL）の解析機能を構想しています。
* 構想内容: AIによるマージン（歯と歯茎の境界線）の自動検出、クリアランス（噛み合わせの隙間）の自動計測。
* 現状の判断: 現段階ではデータの精度や診断に関わる法的制約を考慮し、フェーズ2以降の課題として位置づけています。本アプリでは、これらの外部API連携が容易な拡張性の高いデータ構造を採用します。


## 使用する技術スタック

- 使用するフレームワーク（例：使用するフレームワークのバージョン情報等）
  Rails 7
- データベース（MySQL / PostgreSQLなど）
  MySQL
- デプロイ先（Heroku / Renderなど）
　Render
- 使用予定のライブラリ
　Tailwind CSS
- API
　OpenAI API (ruby-openai)
- Web API
　Web Speech API (音声認識用)
- PDF Library（予定）
　Grover または Wicked PDF (PDF出力用)

## 画面遷移図
https://www.figma.com/design/9kPTYRBa71UC1RpsA4cW7G/Dent-Order-%E7%94%BB%E9%9D%A2%E5%9B%B3?node-id=0-1&p=f&t=1MlAWegqn03ES3mL-0


## ER図
詳細は [こちらのER図][ER_LINK] を確認してください。

[ER_LINK]:https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=%E5%8D%92%E6%A5%AD%E5%88%B6%E4%BD%9CER%E5%9B%B3.drawio&dark=auto#R%3Cmxfile%3E%3Cdiagram%20name%3D%22%E3%83%9A%E3%83%BC%E3%82%B81%22%20id%3D%22hUvmKmgQ_OttKsq_slyQ%22%3E7V1tc5u4Fv41ntn94A7Gxok%2Fxkm73W17bzbp3G0%2FeWSj2GoAUSHH9v76ewTC5kUGnGBjXM20NejlADrPOTo6j6Cd%2Fq27%2FoMhf%2FGF2tjpmIa97vTvOqbZ640s%2BBElm6jkyryKCuaM2LLRruCR%2FItloSFLl8TGQaohp9ThxE8Xzqjn4RlPlSHG6Crd7Ik66av6aI5zBY8z5ORL%2FyE2X0Sl1%2FFTiPKPmMwX8ZV7w1FU46K4sXySYIFsukoU9d93%2BreMUh4duetb7IjBi8cl6vdhT%2B32xhj2eJUO9Pt4c%2B3O7Mf%2FTRw8uhr7M%2FKte52XIgUHfBOPAdy5Lw45moqiccAR41JVfQMKYPA5Ih5mUNALzx0H%2BQEJm0clC%2BLYn9GGLnksKD4bP5E1th8iTYm2oLTPIEycCuFPIPxR3oyoRg6Ze3A8gzsWVxwzHMC9fEYBly0W3HXkYfQsL8hZymfpmENHXNQXmHFQEMFj%2BHNJw9Le7jg1BnGhi9icwNVvoNbw11EzcYfdF8QIgl9v6WJGZlETjzIXOYpWGO62iwI4LmmIHHhID3ExHMqG4tm7yP6xFI8ftfBwot5B3nwJKO3SF8zAxPAeOc9wGeLNo1q05DRRR31OwCTEtfY1ecKILxnuBphzaLPvbsPH4oR6lRrCr08DItqXjadLf5B9I8QZ5rNFwfhFVb1%2BrFAH4NddSLNW9npCLnE2USWgA7k%2BVEqMfMTOCxYDBnX%2FwQC8TH0kBmyEskgAm09%2FAym3AlPy5%2FeoEcdrAYEQ8DchIMHyElUrcLpdl8ZKFadh7Q7Dw3mIaxhzMJcgRj94CT%2BukyaCGUhMeADpRP7A1MWcbaDJIunnhtKrrXZOMbx7USbFDGMfLl2%2FOZLnSPrk%2BVb2zm3BgfRcB3ixUd6LFXm7fa7tQbjn8YIy8q9waI50QEl3F56viAtWBX4f2ZmiMQ3nudBtEce5jXR8J00y7RZFI5tR%2Fyu4FMxlgU%2BJUBPcmzWGPwIOxjurY90JXFjj3u4c%2FojmjN9SDxAO7lfIEH5lhYUrGHPqS6EOforlM6lCcTylnFN3v6N8BSz6BajYpJvUDoIYbaUoGO1FAXTlBDkPEEiA13QinYVxBdrpTKFY5VBvhzc77tkJTTjmJycMDRbEtjHY%2Bni1IBw%2F%2BmgmGkmzLprW7j%2FVpa8i%2FUhhu%2FE5WNp2OhvTpWcHOaVv7%2FMNOFBERmeJgziQidqOA9A2TIifo57DDFCsmoAihk5OWuFMMBWxOeKoC1PEostp1wtnk0TI0wudUPQ3ERuFnYhn4zX8m%2B81yE9C4KHwHCK23Rw0fdMcpIBb7yo9BdUL5q30U6LZ1HPbW%2BY2o7a5rWeUT27Do01u%2FYowiPHSmFfDNonl1TW5xR7DJi%2Bxw%2FjwqZfwI4kKRdutq2PZkl%2B5a00W8AYPW0XcKTzsoC2mVRow1GFsywCzSRwlZKbsHao85OJ4ScpETiDXgsDlOXkimBW3O6SkSaDXGFoUij8l8q088i87%2B%2Beg6YSIkGI5E0ml4HXouCoIBGJ09NOBweB4y95hVfdl6QjxgrMfV1VhMGx4FtPpj%2BM6dQWlc55A0PkPnf8oh3PV3L6e3o6eAOmVz29HS4DELHo5DppO6x4hAZLIdqRyIOa%2BNU%2FrshHtyYEojOAtS8EK4k7gZVW7Sc7Tuk6SA5F0%2Bb40SDH8ihIopdgNMJ9AZBHlVuS2AW8a%2BElYl0cs8Di35qERS7pxfuvLFM2e50xAsJvYuwCTkxfEsMnsa3CE3ro2Ys%2B%2FKbc4hL%2BixrSs6CR58Hu0ByIbRYWjowyhKg4xo07R8MLDeOf8%2FOk8GjxtdMMHDoLYPRKEBtGSxy7Q2J4xOPcnqkeRP9Bqwje%2B1mPL9fhziWy4c96Wp9Z6PH5cWSflUCT%2BlIGmYjvDZVMOMUb0hmO94bjRDcd17SXOcGgTWFq5p91YbKVzTtbRSBWz6q6b2K3p5OMlcmtm1R0iMV40t3aZ3Jqp2DBxnkDQ3Jrm1srhXHXriJ7eLnpzsVl174jZ9JaBk3Fr585ctYcvu8g9w2bVTTaNW8xJ%2BLICUJ171i%2B3mrVbnsY8PDFbkVDsHRqmiV5tYBRLNRsmYFaJ7MzAMJSS8lHonhzyVFFW7KTFbnrkTJDvOwR5mrdrJU%2BQJPoXyNZKbLkSXQgyGMzhbXlqrce3RsDNB8%2Ftfg9p1l8%2Foz%2B%2Fuj8%2FWfcvBv%2BKhoObrmLzmeYENSeoOcHL%2BggRIhOwUQBAIBZaDp03yhrW8jUipTtTbHEocns6qdpyzlCpXAVzXAQWzRi2njFUqlfBHJ8lDDRfOH3TBHRpfKESpAr2W09sl8wWKrWrII2L0HJJXGFtymoVA6bUroIyPksUNM1%2FJYoUVFP1d8TKX2sSL4LAckwm4sRR1a7RqoxjW6zPeKhPIeNHQL3q%2BezlbIYDuZCeUupgVL0zZoyyiQv9w69xH%2FwAOglXQxJOejds5z6Ink%2FL0SWbyVZK2jtv9UJsHD%2BKD0PxzQN2wiTM%2B11NFGVGIQDcT8rosGffiO%2B5w%2Bn7Bxd5m6jsA3HiACLMRuM4VoCLsM03cfLOMKy44HtY0I9P79bJ1ndxUIHXhIuuvXdGz5LnUc%2Ft6a6nOEl2vMeMgDLCPOQ2rtndeuTEwsLEvYfXz%2FaMBpHHgcu%2BwY41l5moKqKahWp4Ses8iUWjHNv3IpzaWcPATIcig15GRIQf2WsH5ZwgKyOonxUUjU1OUG0fn9hvAToxrRPTF5GYVu1r0Cnr%2FBaZ3cv9ybT1VBFwHD%2BVnf26XG9wtK2heQ9Y5Cn1kr%2FluWylciu%2FBdXwWk%2Fnso%2B66bXyW1DnvuTXuexfKpddtELVE9uvkstWarfqC1BNZzH1ey%2BXsHWvVVl%2FpR1UfVGsaXtpKus%2FgxUwmVXL7Jd%2FQh%2B7iDglTbwZ2%2Fgide%2BjIFhRZqvalzAHWHx1Lu4%2F4fQZeyop1b%2Bs9jpKQ%2BfmO%2Fty8zL0PjQ3X5GRqzc3H9lrYWo%2BkV7vpLLro87xsuvfkifyesNBp4QJeEtefqSMkJrLy%2Be2QF710yKq5uVz%2F7vBKCOovry82h6s19lD1Vc0T24Qe%2FA5LMfnzpSMNFM1MI9oS5diEf0swWRlRFS1iIFxnRJkZWeJY1vEdY0WofjIb1NThPFuNMowsMaxJ4muIeelhCGOjjlPxAvnc7EKa5Bx76%2B1imHWvLb%2FM3vtVjH56%2Fbh60f898vN5Av5%2Ft9%2FjNndveZvNX978fytZmnlqrvRt4nqyFAqXZiZd2FFrk7nqVtOwCqVqyBgi8CiCdjWE7BK9SoI2LOEgSZgNQFbCmYFAasntksmYJXaVRCwRWi5JAK2NmW1ilZUaldBK54lCk5CK%2B7jBVvElx%2FQtd5LaqLxbYb4yixyRWNt7h2gruIloME2x3swt2Ke4VtAlnKCaZBsvEqHED0zI6Iy2WilqRXTOBrZqMTx6HU20ch7ceXESjUcxshPob4Y9BVhenYUYJbseDUpPjTTOK3vZTU4ZVSsOHfNIYxYfIGlqWjxfw%3D%3D%3C%2Fdiagram%3E%3C%2Fmxfile%3E