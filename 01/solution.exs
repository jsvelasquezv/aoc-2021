defmodule AOC202101 do
  def count_increments(number_list) do
    number_list
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.filter(fn [first, second] -> second > first end)
    |> Enum.count()
  end

  def sum_windows(number_list) do
    number_list
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum/1)
  end

  def solve input do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> sum_windows()
    |> count_increments()    
  end
end

File.read!("./01/input.txt")
|> AOC202101.solve()
|> IO.inspect()