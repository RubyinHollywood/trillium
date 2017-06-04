defmodule Trillium.Web.GameChannel do
  use Trillium.Web, :channel

  def join("game", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (game).
  def handle_in("set", payload, socket) do
    broadcast socket, "set", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
