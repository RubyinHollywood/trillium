defmodule Trillium.Web.GameChannel do
  use Trillium.Web, :channel

  alias Trillium.Board
  alias Trillium.Set

  def join("game", payload, socket) do
    if authorized?(payload) do
      {:ok, %{board: Board.cards}, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def handle_in("set", payload, socket) do
    %{"body" => cards} = payload

    if Set.valid?(cards) do
      broadcast socket, "set", payload
    end

    {:noreply, socket}
  end

  defp authorized?(_payload), do: true
end
