defmodule RandomMoveGenerator do
  def generate_move(grid, mark_one, mark_two) do
    Board.random_move(grid, mark_one, mark_two)
  end
end
