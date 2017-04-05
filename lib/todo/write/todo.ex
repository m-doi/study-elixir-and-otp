defmodule TodoApp.Write.TodoRepo do

  import Exredis.Api

  # とりあえずuser_idは固定

  def add(key, text) do
    {:ok, client} = Exredis.start_link

    # 投稿イベントの追加
    # キーは"todo:event:${user_id}:post:${key}"
    client |> Exredis.Api.set("todo:event:" <> "user_id:" <> "post:" <> key, text)

    # Stateも更新する
    # ここは分離予定

    # こっちはキー（冗長ではあるが検索のために必要）、キーは"todo:state:${user_id}:${key}:key"
    client |> Exredis.Api.set("todo:state:" <> "user_id:" <> key <> ":key", key)
    # こっちはテキスト、キーは"todo:state:${user_id}:${key}:text"
    client |> Exredis.Api.set("todo:state:" <> "user_id:" <> key <> ":text", text)
    # こっちはステータス、キーは"todo:state:${user_id}:${key}:done"
    client |> Exredis.Api.set("todo:state:" <> "user_id:" <> key <> ":done", 0)
  end

  def done(key) do
    {:ok, client} = Exredis.start_link

    # 完了イベントの追加
    # キーは"todo:event:${user_id}:done:${key}"
    client |> Exredis.Api.set("todo:event:" <> "user_id:" <> "done:" <> key, "done")

    # Stateも更新する
    # ここは分離予定

    # ステータスを更新、キーは"todo:state:${user_id}:${key}:done"
    client |> Exredis.Api.set("todo:state:" <> "user_id:" <> key <> ":done", 1)
  end

end
