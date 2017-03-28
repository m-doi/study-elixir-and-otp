# Twitter Client

## Installation

1. config/config.exs.sampleをコピーしてconfig/config.exsを作成
2. config/config.exsのTwitterクライアントの設定を追加する
3. 以下順番に実行
    ```
    mix deps.get
    mix deps.compile
    iex -S mix
    ```
4. [http://localhost:4000/timeline](http://localhost:4000/timeline)にアクセスする
