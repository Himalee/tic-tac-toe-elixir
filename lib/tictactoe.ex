defmodule TicTacToe do
  def start do
    CLI.welcome_players
    create_new_board()
    |> play("X")
  end

  defp create_new_board do
    CLI.chosen_size_of_board
    |> Board.new
  end

  defp play(grid, mark) do
    CLI.present_board(grid)
    if Board.is_there_a_winner?(grid) or Board.is_full?(grid) do
      CLI.game_over
    else
      CLI.mark_board(grid, mark, "X", "O")
      |> play(switch_marks(mark, "X", "O"))
    end
  end

  defp switch_marks(current_mark, mark_one, mark_two) do
    if current_mark == mark_one do
      mark_two
    else
      mark_one
    end
  end
end
