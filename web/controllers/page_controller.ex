defmodule TwitterClient.PageController do
  use TwitterClient.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
