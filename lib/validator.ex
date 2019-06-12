defmodule Validator do
  def is_valid_board_size?(size) do
    size == "3\n" or size == "4\n"
  end
end
