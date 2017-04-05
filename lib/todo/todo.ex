defmodule TodoApp.Todo do

    defstruct text: ""
end

defmodule TodoApp.TodoRepo do

  import Exredis.Api

  def add(key, text) do
    {:ok, client} = Exredis.start_link
    client |> Exredis.Api.set(key, text)
  end

  def get() do
    {:ok, client} = Exredis.start_link
    res = client |>
      Exredis.query(["KEYS", "*"]) |>
      Enum.map(&(Exredis.Api.get(client, &1))) |>
      Enum.map(&(%TodoApp.Todo{text: &1}))
    {:ok, res}
  end

end
