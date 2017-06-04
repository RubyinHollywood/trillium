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
    end

    {:noreply, socket}
  end

  defp authorized?(_payload) do
    true
  end

  defp valid?(payload) do
    %{"body" => body} = payload

    body
    |> Enum.map(&(String.codepoints(&1)))
    |> Enum.zip
    |> Enum.all?(&all_same_or_different?/1)
  end

  defp all_same_or_different?(dimensions) do
    Enum.member?([1, 3], count_different_dimensions(dimensions))
  end

  defp count_different_dimensions(dimensions) do
    dimensions
    |> Tuple.to_list
    |> Enum.uniq
    |> Enum.count
  end
end
