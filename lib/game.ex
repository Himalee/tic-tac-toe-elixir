defmodule Game do
  def new(players, length_of_pause_after_move) do
    Display.welcome_players
    create_new_board()
    |> play(players, length_of_pause_after_move)
  end

  defp create_new_board do
    Display.chosen_size_of_board
    |> Board.new
  end

  defp play(grid, players, length_of_pause_after_move) do
    Display.present_board(grid)
    if end_of_game?(grid) do
      show_result(grid)
    else
      players
      |> make_move(grid, length_of_pause_after_move)
      |> Board.mark(current_mark(players), grid)
      |> play(swapped_players(players), length_of_pause_after_move)
    end
  end

  defp current_player(players) do
    players
    |> Enum.at(0)
  end

  defp current_mark(players) do
    players
    |> current_player
    |> Player.get_mark
  end

  defp opponent_mark(players) do
    players
    |> Enum.at(1)
    |> Player.get_mark
  end

  defp make_move(players, grid, length_of_pause_after_move) do
    players
    |> current_player
    |> Player.get_move(grid, current_mark(players), opponent_mark(players), length_of_pause_after_move)
  end

  defp swapped_players(players) do
    players
    |> Enum.reverse
  end

  defp show_result(grid) do
    if Board.is_there_a_winner?(grid) do
      Board.winning_move(grid)
      |> Display.winning_move
    end
    Display.game_over
  end

  defp end_of_game?(grid) do
    Board.is_there_a_winner?(grid) or Board.is_full?(grid)
  end
end
