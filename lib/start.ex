defmodule Mix.Tasks.Start do
  use Mix.Task

  def run(_) do
    TicTacToe.start
  end
end
