defmodule Trillium.Web.PageController do
  use Trillium.Web, :controller

  def index(conn, _params) do
    payload = %{message: "Pizza!!!"}
    Trillium.Web.Endpoint.broadcast "game:lobby", "ping", %{body: Poison.encode!(payload)}
    render conn, "index.html"
  end
end
