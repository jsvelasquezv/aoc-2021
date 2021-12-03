defmodule AOC202102 do
  def move(direction, units, {x, y, aim}) when direction == "forward", do: {x + units, y + aim * units, aim}
  def move(direction, units, {x, y, aim}) when direction == "up", do: {x, y, aim - units}
  def move(direction, units, {x, y, aim}) when direction == "down", do: {x, y, aim + units}

  def solve input do
    {x, y, _} = input
    |> String.split("\n", trim: true)
    |> Enum.reduce(
      {0, 0, 0},
      fn line, acc -> 
        [direction, units] = String.split(line, " ")
        move(direction, String.to_integer(units), acc)
      end
    )
    x * y
  end
end

File.read!("./02/input.txt")
|> AOC202102.solve()
|> IO.inspect()