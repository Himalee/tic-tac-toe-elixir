defmodule Board do
  def new(size) do
    size
    |> (fn(x) -> x * x end).()
    |> (fn(a) -> a - 1 end).()
    |> convert
  end

  defp convert(number) do
    Enum.to_list 0..number
  end
end
