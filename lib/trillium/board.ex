defmodule Trillium.Board do
  @size 12
  @dimensions ["0", "1", "2", "3"]
  @dimensions_count Enum.count(@dimensions)

  def cards do
    dimensions(@dimensions_count)
    |> Enum.take_random(@size)
    |> Enum.map(&List.to_string/1)
  end

  defp dimensions(0), do: [[]]

  defp dimensions(dimensions_count) do
    @dimensions
    |> Enum.flat_map(&(another_dimension(&1, dimensions_count)))
  end

  defp another_dimension(dimension, dimensions_count) do
    dimensions(dimensions_count - 1)
    |> Enum.map(&([&1 | dimension]))
  end
end
