defmodule Game do
  def new(players) do
    CLI.welcome_players
    create_new_board()
    |> play("X", players)
  end

  defp create_new_board do
    CLI.chosen_size_of_board
    |> Board.new
  end

  defp play(grid, mark, players) do
    CLI.present_board(grid)
    if end_of_game?(grid) do
      show_result(grid)
    else
      players
      |> current_player
      |> make_move(grid)
      |> Board.mark(mark, grid)
      |> play(switch_marks(mark, "X", "O"), swapped_players(players))
    end
  end

  defp current_player(players) do
    players
    |> Enum.at(0)
  end

  defp make_move(player, grid) do
    player
    |> Player.get_move(grid)
  end

  defp swapped_players(players) do
    players
    |> Enum.reverse
  end

  defp show_result(grid) do
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