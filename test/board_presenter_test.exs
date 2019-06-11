defmodule BoardPresenterTest do
  use ExUnit.Case
  doctest BoardPresenter

  test "displays 3x3 board" do
    board = Enum.to_list 0..8
    assert BoardPresenter.present(board) == "  0    1    2  \n  3    4    5  \n  6    7    8  "
  end

  test "displays 4x4 board" do
    board = Enum.to_list 0..15
    assert BoardPresenter.present(board) =="  0    1    2    3  \n  4    5    6    7  \n  8    9    10   11 \n  12   13   14   15 "
  end
end
