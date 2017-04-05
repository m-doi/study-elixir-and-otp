# Todo App
TODO管理のサンプルアプリケーション

## Installation

1. redisをインストール
    ```
    brew install redis
    ```
2. redisを起動
    ```
    redis-server /usr/local/etc/redis.conf
    ```
3. 以下順番に実行
    ```
    mix deps.get
    mix deps.compile
    iex -S mix
    ```
4. [http://localhost:4000/todo](http://localhost:4000/todo)にアクセスする
