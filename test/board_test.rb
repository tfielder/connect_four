require "minitest/autorun"
require "minitest/pride"
require "./lib/board.rb"

class BoardTest < Minitest::Test
  def test_board_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_print_board
    board = Board.new
    board.print_board
    assert_equal "ABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......\n", board.print_board
  end

  def test_has_board_array
    board = Board.new
    assert_equal [], board.board_array
  end

  def test_initializes_board_array
    board = Board.new
    empty_board = [[".",".",".",".",".",".","."], [".",".",".",".",".",".","."],
    [".",".",".",".",".",".","."], [".",".",".",".",".",".","."],
    [".",".",".",".",".",".","."], [".",".",".",".",".",".","."],
    [".",".",".",".",".",".","."]]
    assert_equal empty_board, board.board_array
  end

end
