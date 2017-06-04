defmodule Trillium.Web.PageController do
  use Trillium.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
