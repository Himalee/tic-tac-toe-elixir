defmodule TicTacToe do
  def start do
    welcome_players()
    chosen_size_of_board()
    |> convert_size_of_board
    |> display_board
  end

  def welcome_players do
    IO.puts("Welcome to Tic Tac Toe")
  end

  defp chosen_size_of_board do
    IO.gets"Choose a board size, 3 for 3x3 or 4 for 4x4: "
  end

  defp convert_size_of_board(user_choice) do
    user_choice
    |> String.trim
    |> Integer.parse
    |> elem(0)
  end

  defp display_board(size) do
    size
    |> Board.new
    |> Display.board
    |> IO.puts
  end
end
