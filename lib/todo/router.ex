defmodule TodoApp.Router do
  use Trot.Router
  use Trot.Template

  alias TodoApp.Todo
  alias TodoApp.TodoRepo

  require Logger

  get "/", do: 200

  get "/todo" do
    {:ok, res} = TodoRepo.get
    render_template("todolist.html.eex", [todos: res])
  end

  get "/todo/new" do
    render_template("new.html.eex", [result: false])
  end

  post "/todo/create" do
    conn = parse(conn)
    key = conn.params["key"]
    text = conn.params["text"]
    TodoRepo.add(key, text)
    render_template("new.html.eex", [result: true])
  end

  # 以下を参考にした
  # http://stackoverflow.com/questions/34476915/elixir-plug-correct-way-to-get-form-data-from-a-post-request
  def parse(conn, opts \\ []) do
    opts = Keyword.put_new(opts, :parsers, [Plug.Parsers.URLENCODED, Plug.Parsers.MULTIPART])
    Plug.Parsers.call(conn, Plug.Parsers.init(opts))
  end

  import_routes Trot.NotFound
end
