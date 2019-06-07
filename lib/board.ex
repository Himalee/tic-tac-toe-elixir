defmodule Board do
  def new(size) do
    square = fn(x) -> x * x end
    Enum.to_list 0..(square.(size) - 1)
  end
end
