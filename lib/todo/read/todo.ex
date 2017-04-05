defmodule TodoApp.Read.Todo do

    defstruct key: "", text: "", status: ""
end

defmodule TodoApp.Read.TodoRepo do

  import Exredis.Api

  def get() do
    {:ok, client} = Exredis.start_link
    res = client |>
      Exredis.query(["KEYS", "todo:state:" <> "user_id:" <> "*" <> ":key"]) |>
      Enum.map(&(Exredis.Api.get(client, &1))) |>
      Enum.map(&(%TodoApp.Read.Todo{key: &1, text: getText(client, &1), status: getStatus(client, &1)}))
    {:ok, res}
  end

  defp convertStatus(done) do
    case done do
      "0" -> "NOT DONE"
      "1" -> "DONE"
    end
  end

  defp getText(client, key) do
    Exredis.Api.get(client, "todo:state:" <> "user_id:" <> key <> ":text")
  end

  defp getStatus(client, key) do
    convertStatus(Exredis.Api.get(client, "todo:state:" <> "user_id:" <> key <> ":done"))
  end

end
