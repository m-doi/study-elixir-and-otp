defmodule TwitterClient.Router do
  use Trot.Router
  use Trot.Template

  alias TwitterClient.Tweet

  get "/", do: 200

  get "/timeline" do
    tweets = ExTwitter.home_timeline |>
      Enum.map(fn(tweet) -> %Tweet{text: tweet.text} end)
    render_template("timeline.html.eex", [tweets: tweets])
  end

  import_routes Trot.NotFound
end
