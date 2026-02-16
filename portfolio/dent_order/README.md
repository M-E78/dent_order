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

[ER_LINK]:https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=%E5%8D%92%E6%A5%AD%E5%88%B6%E4%BD%9CER%E5%9B%B3.drawio&dark=auto#R%3Cmxfile%3E%3Cdiagram%20name%3D%22%E3%83%9A%E3%83%BC%E3%82%B81%22%20id%3D%22hUvmKmgQ_OttKsq_slyQ%22%3E7V1bk5u4Ev41rtp9cApj4xk%2FjmeSzW6Sc2ZnUmeTJ5cMGlsZQETIM%2Fb%2B%2BtMCYXORAY%2FxBUdVSQy6NKD%2ButXqT5BO%2F9Zb%2FsFQMP9CHex2TMNZdvp3HdPs9UYW%2FIiSVVxyZV7FBTNGHNloU%2FBI%2FsWy0JClC%2BLgMNOQU%2BpyEmQLber72OaZMsQYfc02e6Ju9qoBmuFCwaON3GLpP8Th87j0OnkKUf4Rk9k8uXJvOIprPJQ0lk8SzpFDX1NF%2Ffed%2Fi2jlMdH3vIWu2LwknGJ%2B33YUru%2BMYZ9XqcD%2FT5eXXu28%2Fi%2FiYtHV%2BPAJt%2B610UpUnDIV8kYwJ0H4pCjqSgahxwxLlXVN6AABp8j4mMGBb3o3HVREJKoeVwyJ67zGa3ogieCkrPxE1li5yHWlGgLSvsMwsSpEP4Ewh%2FlzYhq5JKZD8c23LG44pjhEO7lMwq5bDHnnisP42d5Qe5CPkvHHLriooHAjIvCGB7DnwsalfY2x5kxSAo9xGYErn4DtUawjJuJO%2By%2BIEYQ%2FPoLDzNix018yjzkKlphuNsuCuG4oiFy4SF9xMVwKBuKZ%2B8i58dCPH7cwsepehf5swWgtEtfMAMTw1vkPMNliD%2BLa9GC01QdDTgBkxDX2tbkCSO%2BYLgbYs6hzba7jR6LE%2BrXagi%2FAQ2JaF81nh79QbaNEGeY2%2FOS8Yurev1EoS7ArzuXZq3s9YQ84q7iSkAH8gKolBj5iN0XLAYM6v6DAXi5%2BlgM2AhlsQA2m%2F4GUm4FpuTP73EjjpcCAhHgbyJAguWlql7B6XY9mihVnEa1GwwPZxGuYczBXMIE%2FeAlgqROmghmIDHlAaQT%2BQNTD3O2gibztJ8bSq%2F2unGK0d2LMilmmPhw6frNkTxH0ifP1rI3bgsOpOfawYuNil6szNttc20Pwj2P55SRf4VDc6UDSru76PyVeGBV4PeRkysa02iei9wWcd3bWMd30iSzblE0chgNvoJLwVwWBJQINcG9WWP4I%2BBgvLM61p3AhTXubc7hj2jO%2BC31AeHgfoUM4VdesXAFY04DKdTFT4l8JlUojqeUc%2Bptd5RvgEW%2FBBWrbJPGQZCgrRIFo60ogK6cIPcBAgnwmm6ssyiuQBudKRSrHOr18ObHPT%2BhCcf85EahwZw4DgZbH7%2FOCcePAbJFI2nWZdPa%2Faem9FWmHylsMz47S1tPZ2O68J2woPT1fe6BA0VkdJY4SAKZuO04BG3DhPg57jnMAcVqCChi6OSkFc0EUxGbI466MEXMu5x2%2FWg2SYU8vcgJxX9TsVHUifgOXsK%2FxV6D4iQEHgrPIGLbzEHTveYgBdx6V9kpqFkwr6UfE82mntv2mduMxua2nlE9uQ0PNrn1a8IgwcvJvBp2SCKvqckt8RgOeUkcxodPvZQfSVUo2q5dHcuX%2FMpdG7KAPTxsHXHH8LCDtphWZcDQhLEtQswmSZSQm7I3qPKRh5MlKRM5gUILApfn5IlgVt5ul5JTAr3B0KJU%2FDGRbxWRf9nZPxdNJ0SEFAtbJJXCt6HjqiQQSNDRzwYGg8Mte4d13ZelI8QLzn5c1YXB8MSzmE5%2FHNapKyid8wSCzn%2Fo%2FEc1nOvm9vX0dvAESK96fjtYAiRh0atxcOq07gESIKlsRyYHYm5b87QuG9GeHIjCCPZZCtYQdwQvq9pNcp7WdZQciKTLt6VByuFXlkCpxG6I%2BQQiizi3IrcN%2BNMwSMO6OmKBx7k1d41Yso2LW1%2BmyH6eMQHBbmrvAkxOfpjAJrevwRV66zqIPf%2Bm3OIQ%2FYoa07Lik%2FTB7%2FEeiHwUFY2OMoSqOcQ2CJhRtioZYngg%2F5zHIJtLgyeOb3jHgRA7SMLIKFry2CUa2zIG5%2F5EzSjyB3qd8FWg9dhyPf5cIAfunLflqbUeDx9bNkk7lIk%2FZrCp2NJw2bRDghG96VhvOj7ppuOm9hPneLQJLK%2B8424utrJ5J%2BtgxIpZd%2BdN4tZ0AvIS%2BTWz7i6RBC%2BaX7tMfs1UbJo4TyBofk3za9Vwrrt9RE9vF73B2Ky7f8Q89baBo%2FFr585etYczu8h9w2bdjTYnt5ijcGYloDr3rF9hNeu0PI25e2K2JqnY2zVME73awCpWajZKwLymsjMDw1BKKkahW3LIU0VZuZMWO%2BqRO0FB4BLka96ulTxBmuyfI0crseVK9CDIYDCHt%2BWptR73jYBPHzy3%2B10ku798Rn9%2B9X5%2Bsu5fDP4VDQc3XcUGNM0Jak5Qc4KX9SEiRCZgowCAUCy0XDo7KWvYyBeJlO5MscWhzO3ppGrLOUOlchXMcRlYNGPYesZQqV4Fc3yWMNB84XSvCejS%2BEIlSBXst57YLpktVGpXQRqXoeWSuMLGlNUqBkypXQVlfJYoODX%2FlSpSUE313xOrTEQx8SIILMdkIk4c1X4rKlqVceyI9RmP9Clk%2FAipXz%2BfvbBtHMqF9JRSF6P6nTFjlE086B99kXvnB9BJuAaScNK7YafwUfRiWo4umC1bKWnvotULsUn8KD4OxVcP2I2SMO83NXGUGYcAcD8Zo8O%2BcyO%2B6Q6n7x885K%2Fisg%2FETQKIKBuNk1gBLsJW38TJO8OwkoLvUUE%2FOb1bplvfJUEFXhIuuvbeGT1Lnsc916ebnuIk3fEeMwLKiPKQ67hmc%2BuxE4sKU%2FceXT%2FfMx5EngQu2wY70VxuoqqJahap4SWr8zQWjWps34twamMNAzMbigx6ORExfmSvDZQLgqycoH5eUDw2BUGNfYBiuwXoxLROTF9EYlq1r0GnrItbZDYv%2BKfT1lNFwHH4VHb%2BC3O9wcG2hhY9YJmn1Ev%2Blueylcqt%2FRbUidd6Opd90E2vtd%2BCOvclv85l%2F1K57LIVqp7YfpVctlK7dV%2BAOnUWU7%2F3cglb91qV9VfaQd0XxU5tL6fK%2BtuwAiZ2vcx%2B9Wf0sYeIW9HEt9kqEKn7AIXhK2WOqn0Fc4DFl%2BeS%2FhNOn7GvklJNQVAX70Fp6Nx8Z1tuXobeu%2BbmazJyzebmY3stTc2n0uudTHZ91Dlcdv1b%2BkRebzjoVDAB%2B%2BTlR8oI6XR5%2BcIWyKt%2BVkTdvHzhfzgY5QQ1l5dX24P1Nnuo%2B4rm0Q1iCz6H1fjcmJKRZaoG5gFt6VIsop8nmKyciLoWMTCuM4Ks%2FCxxaIu4btAiFB%2F6PdUUYbwbjXIMrHHoSaJryHkpZYijQ84TycL5XKzCGuTc%2B1utYpg3r%2FX%2Fzt64VUz%2Bun34%2BhH%2F%2FXIz%2BUK%2B%2F%2Fcfw7671%2Fyt5m8vnr%2FVLK1cdZ%2F0baImMpRKF2YWXViZq9N56pYTsErlKgjYMrBoArb1BKxSvQoC9ixhoAlYTcBWgllBwOqJ7ZIJWKV2FQRsGVouiYBtTFmtohWV2lXQimeJgqPQitt4wRbx5Tt0bfaSmmjczxDfmEWuaayneweoq3gJaLDO8e7MrZhn%2BBaQpZxgTkg2XmVDiJ6ZE1GbbLSy1IppHIxsVOJ49DabOMl7cdXESj0cJsjPoL4c9DVhenYUYJ7seDMpPjSzOG3uZTU4ZVSsODfNIYyYf4GlqWjxfw%3D%3D%3C%2Fdiagram%3E%3C%2Fmxfile%3E