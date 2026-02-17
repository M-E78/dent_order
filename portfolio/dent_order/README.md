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

[ER_LINK]:https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=%E5%8D%92%E6%A5%AD%E5%88%B6%E4%BD%9CER%E5%9B%B3.drawio&dark=auto#R%3Cmxfile%3E%3Cdiagram%20name%3D%22%E3%83%9A%E3%83%BC%E3%82%B81%22%20id%3D%22hUvmKmgQ_OttKsq_slyQ%22%3E7V1tc5u4Fv41ntn94A7Gxok%2Fxkm73W17bzbp3G0%2FeWRQbDWAqJATe3%2F9PQJh8yIDjvELrma6axDigHSec3R0Hol0%2Brfe8g%2BGgvkX6mC3YxrOstO%2F65hmrzey4EeUrOKSK%2FMqLpgx4shKm4JH8i%2BWhYYsXRAHh5mKnFKXkyBbaFPfxzbPlCHG6Gu22hN1s08N0AwXCh5t5BZL%2FyEOn8el10krRPlHTGbz5Mm94Si%2B4qGksmxJOEcOfU0V9d93%2BreMUh4fectb7IrOS%2Folvu%2FDlqvrF2PY53VuoN%2FHq2vPdh7%2FN3Hx6Goc2ORb97ooRQoO%2BSrpA3jzQBxyNBVF45AjxqWq%2BgYUQOdzRHzMoKAXnbsuCkISVY9L5sR1PqMVXfBEUHI2fiJL7DzEmhJ1QWmfQZg4FcKfQPijfBlxGblk5sOxDW8snjhmOIR3%2BYxCLmvMuefKw7gtL8hdyLZ0zKErHhoIzLgojOEx%2FLmgUWlvc5zpg6TQQ2xG4Ok3cNUIlnE18YbdF8QIgl9%2F4WFG7LiKT5mHXEUtDG%2FbRSEcV1RELjTSR1x0h7KiaHsXOT8WovlxDR%2BnrrvIny0ApV36ghmYGN4i5xkeQ%2FxZfBUtOE1dowEnYBLiWduqPGHEFwx3Q8w51Nn2tlGzOKF%2BrYrwG9CQiPpV%2FenRH2RbD3GGuT0v6b%2F4Uq%2BfKNQF%2BHXn0qyVdz0hj7ir%2BCKgA3kBXJQY%2BYjdFyw6DK79BwPwctdjMWAjlMUC2Gz6G0i5FZiSP7%2FHlTheCghEgL%2BJAAmWl7r0Ck6369FEqeI0urrB8HAW4Rr6HMwlTNAPXiJIrkkTwQwkpjyAdCJ%2FYOphzlZQZZ72c0Pp1V43TjF6e1EmxQwTHy5dvzmS50j65Nla9sZtwYH0XDt4sVHRi5V5u22u7UG45%2FGcMvKvcGiudEBpdxedvxIPrAr8PnJyRWMajXOR2yKuexvr%2BE6aZNYtikoOo8FXcCmYy4KAEqEmeDdrDP8EHIx3Vse6E7iwxr3NOfwT1Rm%2FpT4gHNyvkCH8yisWrmDMaSCFuvgpkc%2BkCsXxlHJOve2O8g2w6JegYpWt0jgIErRVomC0FQVwKyfIfYBAArymG%2BssiivQRmcKxSq7et29%2BX7PD2jCMT%2B5UWgwJ46DwdbHr3PC8WOAbFFJmnXZsHb%2FqSl9lelHCtv0z87S1sPZmC58Jywoff2ee%2BBAERmdJQ6SQCauOw5B2zAgfo7vHOaAYjUEFNF1ctCKRoKpiM0RR10YIuZdTrt%2BNJqkQp5e5ITi%2F1KxUXQT8R28hP8X7xoUByHwUHgGEdtmDJruNQYp4Na7yg5BzYJ5Lf2YaDb12LbP2GY0Nrb1jOrBbXiwwa1fEwYJXk7m1bBDEnlNDW6Jx3DIS%2BIwPnzqpfxI6oKi7trVsXzJr3xrQxawh4etI%2B4YHnbQFtOqDBiaMLZFiNkkiRJyQ%2FYGVT7ycDIlZSInUKhB4PGcPBHMyuvtUnJKoDcYWpSKPybyrSLyLzv756LphIiQYmGLpFL4NnSMSgKBBB39bGAwONy0d1jXfVk6Qrzg7MdVXRgMTzyK6fTHYZ26gtI5TyDo%2FIfOf1TDuW5uXw9vB0%2BA1BjfDpYASVj0ahycOq17gARIKtuRyYGY2%2BY8rctGtCcH0mzMUEfcEbysajXJeVrXUXIgki7flgYph19ZAqUSuyHmE4gs4tyKXDbgT8MgDevqiAWac2vuGrFkKxeXvkyR%2FTxjAoLd1NoFGJz8MIFNbl2DK%2FTWdRB7%2Fk25xCH6FVdMy4pP0ge%2Fx2sg8lFU1DvKEKpmF9sgYEbZqqSLoUH%2BOfdBNpcGLY5feMeOECtIwsgoWtJs%2BVh47X2b%2FgO9TvgqaFfL1Vjd0gXn3qJmIPxzgRx4c96WVl%2B6HjchlwPzFOJHS%2F0mIuu6jTDYSfMHit%2BaTO2fybQ5meL9Oqn9BCN6Ya9e2HvShb1NrdnNcVUTmMJ4x13Aa2VzO9bByAuz7uqWxK3pJN8lclhm3ZUYCV40h3WZHJapWJhwnkDQHJbmsKrhXHeJhh7eLnoRr1l3jYZ5amr%2BaBzWuTNE7eGlLnJtrll3McvJLeYovFQJqM49T1iYzTotT3zunsqtSdz1dg3TxF1tYO4qNRslYF5T2ZmBYSglFaPQLTnk3dlBsWoduRMUBC5Bfsu4sQtmFt7KEImvbmgltlyJHgQZDMbwtrRa63HfCPj0wXO79%2FvY%2FeUz%2BvOr9%2FOTdf9i8K9oOLjpKhZ5aU5Qc4KaE7ysj%2F0gMgEbBQCE0eILOjspa9jIV3%2BU7kyxxKHM7emkass5Q6VyFcxxGVg0Y9h6xlCpXgVzfJYw0HzhdK8B6NL4QiVIFey3HtgumS1UaldBGpeh5ZK4wsaU1SoGTKldBWV8lig4Nf%2BVKlJQTfX3YlUmopjYOiK2oKg2o1TsPIpmZRw7Yn7GI30KGT9C6tfPZy9sG4dyIj2l1MWo%2Fs2YMcomHtwfffV65wboJFwDSTjp3bBT%2BPB4MS1HF8yWtZS0d9HqhdgkfhQfYOKrB%2BxGSZj3mytxlBmHAPA%2BGaPDvnMjvpsOp%2B8fPOSv4rIPxE0CiCgbjZNYAR7CVt%2FEyTvDsJKC71FBPzm9W6Zr3yVBBV4SLm7tvTN6ljyP71yfbu4UJ%2Bkb7zEjoIwoD7mOazavHjuxqDD17tHz83fGnciTwGVbZyeayw1UNVHNIjW8ZHWexqJRje17EU5trGFgZkORQS8nIsaPvGsD5YIgKyeonxcU901BUGMfedhuAToxrRPTF5GYVq1r0Cnr4hKZzSb6dNp6qgg4Dp%2FKzn%2FFrTc42NLQogcs85R6yt%2FyXLZSubV3QZ14rqdz2Qdd9Fp7F9S5T%2Fl1LvuXymWXzVD1wPar5LKV2q27AerUWUy97%2BUSlu61KuuvtIO6G8VObS%2BnyvrbMAMmdr3MfvWn6rGHiFtRxbfZKhCp%2BwCF4Stljqp%2BBXOAxdfdkvsnnD5jXyWlmoKgLt6D0tC5%2Bc623LwMvXfNzddk5JrNzcf2WpqaT6XXO5ns%2BqizZ3ZdEgPK9Pq39Il84HDQqaAC9knMj5Qh0ukS84U1kFf9rIi6ifnCnxEY5QQ1l5hXG4T1NoOou0fz6BaxBZ%2FDanxubMnIUlUDc19jOgBVdW4W0c8zTFZORF2LGBjXGUFWfpg4tEVcN2gRiq%2FpnmqMMN6NRjkK1th7lCgBtnhm15ADU8oQR4ccJ5KZ87lYhTXIufe3WsUwb17rP4HeuFVM%2Frp9%2BPoR%2F%2F1yM%2FlCvv%2F3H8O%2Bu9cEriZwL57A1TStnHafdDtREylKpQsziy6szNXpRHXLGVilchUMbBlYNAPbegZWqV4FA3uWMNAMrGZgK8GsYGD1wHbJDKxSuwoGtgwtl8TANqasVvGKSu0qeMWzRMFReMVtxGCKLEOOw9a7bXZk6YI5tHwC8%2Fip%2Bk9gn4Zyb%2FaRmnDczx7fmEyuabOn2wvUVWwGGqxTvTtTLOYZ7gaylOPMCTnHq2wk0TNzImpzjlaWYTGNg3GOShyP3mYT57o%2Frh4QE%2BhnYF%2BO%2Bpo4PTsqME96vJkcH5pZoDa3aw1OGRUzz011CCfmX2CKKmr8Hw%3D%3D%3C%2Fdiagram%3E%3C%2Fmxfile%3E