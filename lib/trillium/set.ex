defmodule Trillium.Set do
  def valid?(cards) do
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
