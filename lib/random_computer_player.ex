defmodule RandomComputerPlayer do
  defstruct [:mark, :length_of_pause_before_move]
end

defimpl Player, for: RandomComputerPlayer do
  def get_move(random_computer_player, grid, mark_one, mark_two) do
    random_computer_player.length_of_pause_before_move
    |> :timer.sleep
    Board.random_move(grid, mark_one, mark_two)
  end

  def get_mark(random_player) do
    random_player.mark
  end
end
