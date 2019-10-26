# Rmdとshellで分析を自動化する

- 第82回R勉強会のためのRepositoryです.
- [発表資料 - 分析が大変なのでRmdとshellで自動化してみる](https://docs.google.com/presentation/d/1aS9nr6mfQZJKmZjbqaoiBOYqmzMWxD1y7KRt6CNFvlk/edit?usp=sharing)

## 背景

- 「グループ数×手法の数だけモデルを作る」ちょっと量の多い分析をしていた
  - グループと手法ごとにモデルを作って
  - 性能を比べて
  - モデルを解釈して ...
  
- 試行回数を増やすために、可能な限り自動化したい

## 解決策

- shellとRmdを使って自動化する

### 役割

- experiments.sh
  - output用のフォルダを作成
  - Rmarkdownを実行する際に引数(グループ名)を渡す

- knit_rmd.R
  - Rmarkdownファイルを実行する
  - 引数(グループ名)を受け取ってRmarkdownに反映させる

- modeling.Rmd
  - グループごとにモデル構築を行う
  - 結果を保存
  
- おまけ
  - send_to_home.R
    - 分析結果をgzipしたものを環境変数に登録されているアドレスに送信する
    - Google acountのSecurityがちょっと不安
    - 実行する前に↓が必要
      - `export ADDRESS="<your-gmail-address>"`
      - `export PASSWORD="<your-gmail-password>"`
  
### Memo

- Rmdの実行時にグループの引数を与えていますが、今回はサンプルのため使っておりません.
- モデリングも形だけなので特に意味はないです