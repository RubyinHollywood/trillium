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
    if valid_set? payload do
      broadcast socket, "set", payload
    end

    {:noreply, socket}
  end

  defp authorized?(_payload) do
    true
  end

  defp valid_set?(payload) do
    %{"body" => cards} = payload

    three_cards?(cards)
      and all_valid_dimensions?(cards)
      and all_on_the_board?(cards)
      and all_same_or_different?(cards)
  end

  defp three_cards?(cards) do
    Enum.count(cards) == 3
  end

  defp all_valid_dimensions?(cards) do
    cards
    |> Enum.all?(&valid_dimensions?/1)
  end

  defp valid_dimensions?(card) do
    ~r/[0-3]{4}/
    |> Regex.match?(card)
  end

  defp all_on_the_board?(_cards) do
    true
  end

  defp all_same_or_different?(cards) do
    cards
    |> Enum.map(&(String.codepoints(&1)))
    |> Enum.zip
    |> Enum.all?(&same_or_different?/1)
  end

  defp same_or_different?(dimensions) do
    [1, tuple_size(dimensions)]
    |> Enum.member?(count_unique_dimensions(dimensions))
  end

  defp count_unique_dimensions(dimensions) do
    dimensions
    |> Tuple.to_list
    |> Enum.uniq
    |> Enum.count
  end
end
