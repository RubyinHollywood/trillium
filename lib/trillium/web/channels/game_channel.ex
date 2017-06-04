defmodule Trillium.Web.GameChannel do
  use Trillium.Web, :channel

  def join("game", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def handle_in("set", payload, socket) do
    if valid? payload do
      broadcast socket, "set", payload
    else
      {:noreply, socket}
    end
  end

  defp authorized?(_payload) do
    true
  end

  defp valid?(_payload) do
    true
  end
end
