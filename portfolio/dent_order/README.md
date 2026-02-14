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

[ER_LINK]:https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=%E5%8D%92%E6%A5%AD%E5%88%B6%E4%BD%9CER%E5%9B%B3.drawio&dark=auto#R%3Cmxfile%3E%3Cdiagram%20name%3D%22%E3%83%9A%E3%83%BC%E3%82%B81%22%20id%3D%22hUvmKmgQ_OttKsq_slyQ%22%3E7V1bk9o2FP41zLQPZLDBXB7DbtJ0su3sbDJt05cdgbWgjW05sligv76SJYMvwha7BmyimU2wdcPS%2Bc7F35FNp3%2Fjb34jIFz%2BgV3odeyeu%2Bn0bzu2bVlDi33wkq0oGdkjUbAgyJWN9gVf0H9QFvZk6Qq5MMo0pBh7FIXZwjkOAjinmTJACF5nmz1hL%2FutIVjAQsGXOfCKpX8jly5F6TiZBS%2F%2FBNFiSXcTnogaHySN5UyiJXDxOlXU%2F9Dp3xCMqTjyNzfQ44uXrIvo9%2FFA7e7CCAyoTgf8bbod%2B3P3y1%2BPHpyMpuEc%2FdMdF0eRA0d0m6wBu%2FKQH1Iw40XTiAJCpaj6PVbAFp8CFEDCCqz43PNAGKG4uShZIs%2B9A1u8oslAydn0CW2g%2ByAkxdsyod2xwfgpH%2FyJDf5FXgyvBh5aBOx4zq6Yf%2BOUwIhdyx2IqGyxpL4nD8VcXoC3knPp2EOPf2nIMeOBSMBj%2BGOF41Jrf5xZg6TQB2SB2Le%2FZ7W9cCOa8SvsvgCCAPsMVj4kaC6aBJj4wFO0guxquyBixxUNgccmGQDKl0PZkM%2B9C9znFZ%2B%2BaBHAVL0HgsWKobSLXyBhKgYPjPOdfQ0KFqIWrChO1eGQIqYS%2FLsONXmCgK4I7EaQUtbm0NXG06IIB1oN2WeII8TbV62nj5%2FRoRWiBNL5smT9RJXVTwTqMfh1l1Ktlb2egI%2B8rahk6AB%2ByColRj5B7wXyBWN1f0IGvFy9GIbpCCZiALKY%2FcJGueGYkh%2B%2FikYUbjgEYsC%2FjwHJNC9VtWZGt%2BvjRKj8NK7dY3i4iHHN1pypS5Sgn1mJMKmTKgIJGzFlAaQR%2BQ1iH1KyZU2WaTs3lFZtvTeK8dXzMjnMMLHh0vRbI3kOpE1e7Mbemy12IC3XEVZsUrRiZdbukGl74OZ5usQE%2FccNmicNUNrcxedr5DOtYnYfuLmiKY79XGy2kOfdCBnfSpXMmkXeyCU4%2FMpMCqSyIMSIi4ldmzNlfxwOvXdOx7nluHCm1v6c%2FfHmhN7ggCGcmV8%2BBrcra8hNwZTiUA7qwadkfCJFyI9nmFLsHzaUr4BFvwQV22yT2kGQoK0SBZODKGBdKQLeAwskmNX0hMziuALsZaYQrHKpd8ubX%2Fe8Q%2BOG%2BcmLQ4Mlcl3IdH26XiIKv4RgzhtJtS5za%2Fef65JXmXzkYPv1OXq0nTub4lXgRgWh767zDThQREaNxEESyIi204hJmznEO9FzmAOKUxNQ%2BNJJpxV7ghmPzQEFXeYill2Ku0HsTVIhjxUbIfEvFRvFnVDgwg37v9hrUHRCzELBBYvY9j5o9iYfpIDbzsVsTgHmggM7B5pt49ve4tt6tfk2q1ft3IYnc259TRgkeLmYVYMuSsary7klFsNFL4nB%2BPjZStmRVIWi7c7UkXzJz9y1Jg14g4XVGe4cFnbQFtWqDBjqULZVBMnjK6IENsyNdWyUwHsdFSbk0R0AX977vgAyXwJSbILYOlD0hCCpaHhMySVVrsYgp3T4c%2BqgU9RBw0MaHvKqeMh1ilAc9HrptTMMZcrTiAJMXEiiMi%2FwdhJzVBLRJ8a1n43wB4mpqj%2FEH%2BrGIY651btiGnOkC4PhhcNRw2OeNiZS5GabCQRDZBoisxrOukk6495OzmRa1f7tZExmsh2mGgeXzs%2BcgMlM0ZYZMtM%2BRBm0jlZsD5mpUIK3MCkaw53Byqq2hTVTu85CZsp9L03nM8vVwMVzivecbHG88u4RpI%2FsssUNuLzPD2ZRmFYwveWwj12ObOMiizUD8%2B8LwpWhmyIbmJsMogTAOSLC4wjquoB8%2F0XJScSfvMZ2HHGSPvhVkBZ5CcWrU040lC8xwV7Z8rLJBE2ef44RZ9MVV3zkKnC%2BJ4p1syXzLhHZgTVo%2BoxqkuQzWD%2FSbWgE2XZB%2FlgBl106bcu0jSDPEOXWmT8sG%2F6cYa9dDHtN%2FtDkD03%2B8IL5wxOkBhVIPtyeTyMpi7OJ7N7RT2cU0w0q4v%2FTPy3hZPk352QJJlt3K2FiVA0Re415Rlt321uCF5NnvM48o63Ye9VMIJg84%2BxNbuinyDPauttojHu76icmbN19NPalt0%2BcLc%2Bon0%2F7mbrWBOz2Pwhh6244urjGnCV3WAKqppOO8d0uTxi2mzvNBl4HJqERj9WQym3uImmklyuNJX9CBniPIAw9BAKTwGtnuiCd818C10ix7VL0mbsnzJu2ZdpGkFcQx7b76cLnPz%2F%2Bu30Y3c9%2Bv%2Fn07cfd3Ppr8km5k95kB0128Kqyg83MAZ71GUKxUfKyLzlz7BJ7qUtoqa2Y4gGKUnNniM2W5%2B2U0lU9P1GKF5O3a33eTg0ExVb%2FZgLB5O1M3q4azootfMa9XXXeTo0DxfakUsBcU96uNnG1KhulFq9if1IzcXDpbFSqKPPyLq0HxSoJqINv2GoG62W4No3hT6O28%2F7mO%2Fj9q%2F%2Fjs3P%2F0qNfwXDwvqsISg3VZqg2Q7VdF9UG0CPTUQaAiC3lo4cX52XdBtlgdPdrMW%2BJRpXmTHFTUmb2zD1Jyyk3pXAVdyRlYDGEW%2BsJN6V4FTckjYSBodsM3VYJZsVDH8axXTPZppSu4lmJMrQYqq3tVJtSuoonJRqJggYRbbsd1jUybYS%2FdYXdhMm9bvxIt6u4F6PQ5XdlNJYiH%2BM5woH2GNFqPoeRvH2eYexBoN8ZEoLJo8%2F6x7%2BnefQEDPVWA%2FUmbRp0Cz9pWiTj8IrMZSvlMx5FXefDJlEj%2F0UFun2AXky9fNjXiNhSOH52PRlVg4H7nv8iKzv98OCDYCvKPiIvCRviDZ8wiRDYl5DtP%2BmTb%2FzknZOc3m7SlbdJGAE3iPJu1rueJU9FR3skT%2Fcd%2BUm63z0kiMkhJh53gcz%2BqoXVigtTly2WiiZByaElTeSTc0Ka2CXxYr9kJZtGXK8awfc8VEqxKHY2zBjkaRSBEtlrD9jCQE5uoH5%2BILE2hYFqQ37%2FypB%2FCMHD8bkQXJpqawyCnUkewaPXIXg4HGcRPDgZgtW24TBeTdrEpE2uIm3StvcXXfb3T3gq%2F8Q%2Ff6KRaOnnPLtVR6ZF%2FVBx0QKWWUpDSLU806IUrvarqQ6CwGRa2pVpUYpX%2B9VUF4aBybSYTEslmHVfr2Uc25VkWpTS1X0r1aU5dpNpOaUt0H0n1aVRcJZMi8Zv90IfIK%2BiTQiiaI2Jq2ymlWK4zMZjk9jQpndlPHgsvauZxKyX3hXq9ip215p0TsLu7hIp3Z78yn0yxe5UJFP4Wf5bO5oJj4nSF1yOLs6%2FZNke9bND6NLFhV%2BFneQGOnXCw3mdRui%2Bzu3sKlGC0KE1rsLoXqF6TkajBvYJNepatCLP8fWd3BC6WjHoZZMoTt5XnForRjVqheKp6YtpRS8B9l4rJvo6YWV1ojc%2BXimUeK8zs9g4pXDGWaVwHOt1SjF0skoxOLdSjOtUiga4igTY2dBpeKK9HWU6OD5p8JTcNzdGI3IP3Qxe6yaGeX9j51Tr1RrBTgnmjOW%2BObsNXf6BXchb%2FA8%3D%3C%2Fdiagram%3E%3C%2Fmxfile%3E