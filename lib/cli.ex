defmodule CLI do
  def welcome_players do
    Console.present(Message.welcome)
  end

  def present_board do
    chosen_size_of_board()
    |> convert_size_of_board
    |> display_board
  end

  defp chosen_size_of_board do
    Console.receive(Message.size_of_board)
    |> valid_board_size
  end

  defp valid_board_size(size) do
    if Validator.is_valid_board_size?(size) do
      size
    else
      chosen_size_of_board()
    end
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
    |> BoardFormatter.format
    |> Console.present
  end
end
