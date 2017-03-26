defmodule TwitterClient.TimelineController do
  use TwitterClient.Web, :controller

  alias TwitterClient.Tweet

  def index(conn, _params) do
      # ここにtweetsを取得する関数を呼ぶ
      # tweets = Repo.all(Tweets)
      tweets = [
          %Tweet{owner: "@doilux1",  text: "Hello!!"},
          %Tweet{owner: "@doilux2", text: "Good Morining!!"},
          %Tweet{owner: "@doilux3", text: "Good Night!!"}
      ]
      render conn, "timeline.html", tweets: tweets
  end
end
