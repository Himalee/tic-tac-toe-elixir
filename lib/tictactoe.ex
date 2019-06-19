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
    if end_of_game?(grid) do
      result(grid)
    else
      player = human_player(grid)
      marked_board = Board.mark(Player.get_move(player), mark, grid)
      next_mark = switch_marks(mark, "X", "O")
      play(marked_board, next_mark)
    end
  end

  defp human_player(grid) do
    %HumanPlayer{
      move: HumanPlayer.move(grid)
    }
  end

  defp result(grid) do
    if Board.is_there_a_winner?(grid) do
      Board.winning_move(grid)
      |> CLI.winning_move
    end
    CLI.game_over
  end

  defp end_of_game?(grid) do
    Board.is_there_a_winner?(grid) or Board.is_full?(grid)
  end

  defp switch_marks(current_mark, mark_one, mark_two) do
    if current_mark == mark_one do
      mark_two
    else
      mark_one
    end
  end
end
