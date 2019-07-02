defmodule RandomComputerPlayer do
  defstruct [:mark, :length_of_pause_after_move]
end

defimpl Player, for: RandomComputerPlayer do
  def get_move(random_computer_player, grid, mark_one, mark_two) do
    get_length_of_pause_after_move(random_computer_player)
    |> :timer.sleep
    Board.random_move(grid, mark_one, mark_two)
  end

  def get_mark(random_player) do
    random_player.mark
  end

  def get_length_of_pause_after_move(random_player) do
    random_player.length_of_pause_after_move
  end
end
