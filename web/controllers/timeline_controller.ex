defmodule TwitterClient.TimelineController do
  use TwitterClient.Web, :controller

  alias TwitterClient.Tweet

  require Logger

  def index(conn, _params) do
      tweets = ExTwitter.home_timeline |>
        Enum.map(fn(tweet) -> %Tweet{text: tweet.text} end)

      render conn, "timeline.html", tweets: tweets
  end
end
