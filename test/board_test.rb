require "minitest/autorun"
require "minitest/pride"
require "./lib/board.rb"

class BoardTest < Minitest::Test
  def test_board_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_print_board

  end

end
