defmodule TicTacToe do
  def start do
    Game.new([%HumanPlayer{mark: "X"},  %HumanPlayer{mark: "O"}])
  end
end
