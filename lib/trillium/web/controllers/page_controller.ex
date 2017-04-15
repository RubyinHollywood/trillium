defmodule Trillium.Web.PageController do
  use Trillium.Web, :controller

  def index(conn, _params) do
    payload = :erlang.term_to_binary(%{
      message: "Pizza!!!"
    })
    Trillium.Web.Endpoint.broadcast "games:lobby", "set!", %{body: :erlang.binary_to_term(payload)}
    render conn, "index.html"
  end
end
