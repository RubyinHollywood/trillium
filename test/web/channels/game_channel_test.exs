defmodule Trillium.Web.GameChannelTest do
  use Trillium.Web.ChannelCase

  alias Trillium.Web.GameChannel

  setup do
    {:ok, _, socket} =
      socket("user_id", %{some: :assign})
      |> subscribe_and_join(GameChannel, "game")

    {:ok, socket: socket}
  end

  test "ping replies with status ok", %{socket: socket} do
    ref = push socket, "ping", %{"hello" => "there"}
    assert_reply ref, :ok, %{"hello" => "there"}
  end

  test "set broadcasts to game", %{socket: socket} do
    push socket, "set", %{"hello" => "all"}
    assert_broadcast "set", %{"hello" => "all"}
  end

  test "broadcasts are pushed to the client", %{socket: socket} do
    broadcast_from! socket, "broadcast", %{"some" => "data"}
    assert_push "broadcast", %{"some" => "data"}
  end
end
