defmodule TwitterClient.Router do
  use Trot.Router
  use Trot.Template

  alias TwitterClient.Tweet

  require Logger

  get "/", do: 200

  get "/timeline" do
    tweets = ExTwitter.home_timeline |>
      Enum.map(fn(tweet) -> %Tweet{text: tweet.text} end)
    render_template("timeline.html.eex", [tweets: tweets])
  end

  get "/tweet/new" do
    render_template("new.html.eex", [result: false])
  end

  post "/tweet/create" do
    conn = parse(conn)
    text = conn.params["text"]

    Logger.debug text

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
