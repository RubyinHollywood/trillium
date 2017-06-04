defmodule Trillium.Board do
  @size 12
  @dimension_values ["0", "1", "2"]
  @dimension_count 4

  def cards do
    dimensions(@dimension_count)
    |> Enum.take_random(@size)
    |> Enum.map(&List.to_string/1)
  end

  defp dimensions(0), do: [[]]

  defp dimensions(dimensions_count) do
    @dimension_values
    |> Enum.flat_map(&(another_dimension(&1, dimensions_count)))
  end

  defp another_dimension(dimension, dimensions_count) do
    dimensions(dimensions_count - 1)
    |> Enum.map(&([&1 | dimension]))
  end
end
