App URL:https://dent-order.onrender.com  

note記事:https://note.com/m_e_78/n/ncc8b1f38cb1c  

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
  MySQL (開発環境) / PostgreSQL (本番環境：Neon)
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

[ER_LINK]:https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=%E5%8D%92%E6%A5%AD%E5%88%B6%E4%BD%9CER%E5%9B%B3.drawio&dark=auto#R%3Cmxfile%3E%3Cdiagram%20name%3D%22%E3%83%9A%E3%83%BC%E3%82%B81%22%20id%3D%22hUvmKmgQ_OttKsq_slyQ%22%3E7V1tc9q4Fv41zOx%2BoAMGk%2FKxJH25t%2B3ebtK5bT8xAiug1LZcWSRhf%2F0e2RL4RdgGTIypZrqLLcnHts6Ljp5HcjqDa%2B%2F5PUPB8jN1sNuxes5zZ3DTsax%2Bf2zDjyhZxyVX1lVcsGDEkY22BXfkHywLe7J0RRwcphpySl1OgnThnPo%2BnvNUGWKMPqWb3VM3fdcALXCu4G6O3HzpN%2BLwZVz6Wr2FKP%2BAyWKp7twfjeMaD6nG8k3CJXLoU6Jo8LYzuGaU8vjIe77Grug81S%2Fxde921G4ejGGfV7mA%2FpisX3tz5%2B7%2FUxePrybBnHzvvs5LkYJDvlZ9AE8eiEOOZqJoEnLEuFTVoAcF0PkcER8zKOhH566LgpBEzeOSJXGdT2hNV1wJUmeTe%2FKMndtYU6ItKO0TCBOnQvg9CL%2BTDyOqkUsWPhzP4YnFHScMh%2FAsn1DIZYsl91x5GL%2FLI3JX8l061sgVNw2EzbgojM1j9GtFo9L%2B9jjVB6rQQ2xB4O5voLYXPMfNxBN2HxEjCH79lYcZmcdNfMo85GpaYXjaLgrhuKQhcuElfcRFd2gbinfvIudhJV4%2FbuHjRL2L%2FMUKrLRLHzEDF8M75PyE2xB%2FEdeiFaeJOhpwAi4h7rWryT1GfMVwN8ScQ5tdTxu9FifUr9QQfgMaEtG%2BrD89%2BkB29RBnmM%2BXBf0XV%2FUHSqEumF93Kd1ae9U98oi7jivBOpAXQKW0kQ%2FYfcSiw6DuLwyGl6mPxYCPUBYLYIvZHyDlWtiU%2FPkzbsTxszCByODfRAYJnpeoeoKg2%2FWoUqo4jWq3NjxaRHYNfQ7uEirrhygRqDrpIpiBxEQEkEHkPaYe5mwNTZbJODeSUe1pGxSjpxdlUsxIncvQ31eREMmYvNjI3oYtOJCRa48oNs5HsaJotyu03YrwPFlSRv4RAc2VASgZ7qLzJ%2BKBV0HcR06maEKjcS4KW8R1r2Md30iXTIdF0chhNPgKIQVzWRBQItQEz2ZP4J8wh94ru2PfCLuwJ%2F3tOfwTzRm%2Fpj5YOIRfIUPElScsQsGE00AKdfG9ks%2BkCsXxjHJOvd2B8gCzGBRYxTrdpHYjUBlDqRWMd1oBXMoJcm8hkYCo6cY6i%2FIKtNWZRrHart50b7bfswOaCMz3bpQaLInjYPD1ydOScHwXoLloJN26aFj78rEufRXpRwrb9s%2Fe0jbD2YSufCfMKX3znEfYgSYzOks7UIlM3HYSgrZhQPwUXznKGIpdk6GIrpODVjQSzERujjjqwhCx7HLa9aPRJJHy9KMgFP%2BXyI2ii4jv4Gf4f%2F6qYX4QggiFF5Cxbceg2VFjkMbc%2BlfpIaheY95If0lrtszYdszY1qttbOv3yge30ckGt0FFM1D20lhUww5R8uoa3FTEcMijChjvPvYTcSRRoW1rVW67CYssW9L6S2sy%2BSNCahVxLxFSh23xpdIM4UTeNYcJMJlPoRdlHdzZ1%2BIhMzT%2FuWBCVd3EhBZCth%2Bq7s1Mdl3xfl0HsZ9%2FaOe90a%2BosWw7Pkke%2FPmndn4bi84nGPFzF%2FnFKsRsqpKijIBEMx95WE3BmcBA8k0IdD8n9wQzXcO8fx7h%2F%2FuUNhkrakzHCsW%2FZPCw88HjshFTF82mRKRhq7kA4sLDrGNcjhcNBulkang6qGBUdQSwTVZ9wYjRVVUzGDWcCBjI6LRBXUODnachGMzIYEbl5lyVDzHD28lBowrj28lAI8W3ldtB01D4CUCjBEJksKDzuLQm%2FzlmFnke%2BYZu8c55OuaLIFBydUIFGEZTVATglNpuiPkUkpIY2pGrNPxZGCTNujzZgde5tvZNdtKNzxZZi3pHm31V7OI5CFhQti7o4nNHF9NIXiVYUdMRYsFOGDlFS15b3hYe%2B9hXf0BPU74O2vXmelvd0QXn%2Fkb1mPCvFXLgyXlb3vrS9bhNuRyY4hA%2FWlk5FYDtLr5iL82fKH%2BrkxU4kxm3mh3%2BPqyAshGzjtqso250HXVdS6QzNNcUpjDey66XttOwkH0y3sOquphIhTWDD14i%2FWVVXQej7MXQX5dJf1maNQ3naQiG%2FjL0V7k5V13dYYa3i14zbVVd3mE1zeq%2FGP117gxRe3ipi1wZbVVdB9O4xzS1MrotOGFuNuu0HPjcH8qtSNz1903TxFVtYO5KNRsBME8JdGbY62klVV5Xvz87KNbMI3eKgsAlyG8ZN3bBzMKhDJH4yIlRYsuV6EGSwWAMb8tbGz0emwE3nzy3e6vQfPD8E%2F3nq%2Ffro%2F3lsce%2FotHwTVezyMtwgoYTNJzgZX1bCZEp%2BCgYQBgtvqCLRllDa1wQOKvCadpwplniUBT2DKjacs5Qq1wNc1xkLIYxbD1jqFWvhjk%2BSzMwfOHsqAHo0vhCrZFq2G8zsF0yW6jVroY0LrKWS%2BIKa1NWqxgwrXY1lPFZWkHT%2FFeiSEM1Vd%2BLVQpEMbF1RGxB0W1GKdl5FM3KOHbE%2FIxH%2BhQyHkLqV8ezV%2FM5DuVEekapi1H1izFjlE09uD76yPjeL2BAuBpAOBndsJP7znselqMrNpettLR33uuFWJU%2Fis8%2F8fUtdiMQ5u22Js4y4xQAnifldNh33ojP1MPp21sP%2Beu47B1xVQIRodFY5QpwE7b%2BLk5e9Xq2KvgRFQzU6c1zsvWNSiqiVGR7tzjuRIWJ20WXfMGMQM9HoGNU%2BEz4d%2FXEcBzfrz%2BUp9v7iZN14iQrKO5ArpKWXR2ttJYZpCpaNItU8JjWd9IOe%2BV2%2FUWkUgmURS19VDBL1pRj25FXbc1YIygzU%2B9nBMV9kxNU27chdlu%2FAaUNKH0RoLRuTYOBq%2FPLY7Yb6JOQ9UyTbJwexh5k4qJVFKOPWxaaj4BFkdJM91uOY2uVW3kHVMPzPINjn3TBa%2BUdUOc%2B3Tc49m%2BFYxfNTs3A9rvg2FrtVt381DSCafa8XMKyvVYh%2Flo%2FqLpJrGl%2Faf5vAZSj%2Bru%2BOrM1R%2Bwh4pY08edsHQjYPkBh%2BESZU%2FLhfR1rgMWX3dT1U05%2FYl8npZx%2BoC4%2Bgs4wuHxnFy4vU%2B99cfmKbFy9uHzsr4WwvALIX%2FUyGPm4sy9GnoHpJSmgxem%2FJ0%2FkDUfDTjENoEX4OxWB%2BbE2RWoOmM%2Btf7wapEVUBeZzf31gnBFUHzCvdwj7MIeouj%2FzxT1ih32Oyu1z60sxw7VxpqF1rDPtwXm11SOySOrAzoio6hHD3uuUIDs7TJzaI17X6BGaL%2Bk2NUb0Xo3Habvu944eJQoMW9yz25MDU8IRx6ccJ9TM%2BVy8wh5mwvuhXjHKutfmr83X7hXT%2F17ffv2A%2F358M%2F1MfvzvW29%2B88UQuIbAvXgC19C0ctrd6FaiOiBKbQiz8iGsKNQZoLrlDKxWuRoGtshYDAPbegZWq14NA3uWZmAYWMPAlhqzhoE1A9slM7Ba7WoY2CJruSQGtjZltYpX1GpXwyuepRW8CK9Y4c9nI8dhm502e7J0wRLefArz%2BJn%2Bj283Q7nXe0tDOB7njweCyRV9trl9QF3NRqDhBuoto1g6SRg6ZmZ2otDHbR86EEi2tWNMg3zjVTqL6FsZEZX5RjvNrli9k%2FGNWhseH%2BYP57ovrppx7mQWS0z%2FmK1s58YPZpmQgxnzkZW24BNuZfseBJ5t%2Ff2wGPof3%2F3lPyzf331Ts6hLiehHWnC%2Ff6AFn41hbmZkx4bWUWam189%2BE%2Btgw4RTRgVOsm0Oye%2FyM3WwaPEv%3C%2Fdiagram%3E%3C%2Fmxfile%3E
