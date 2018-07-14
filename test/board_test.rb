require "minitest/autorun"
require "minitest/pride"
require "./lib/board.rb"

class BoardTest < Minitest::Test
  def test_board_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_print_board
    skip
    board = Board.new
    printed_board = board.print_board
    assert_equal "ABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......\n", printed_board
  end

  def test_has_board_array
    board = Board.new
    assert_equal Array.new(7){Array.new(6)}, board.board_array
  end

  def test_initializes_board_array
    board = Board.new
    assert_equal Array.new(7){Array.new(6)}, board.board_array
  end

  def test_adds_token_to_board
    skip
    board = Board.new
    board.add_token_to_board("A", "X")
    assert_equal "ABCDEFG\n.......\n.......\n.......\n.......\n.......\nX......\n", board.board_array
  end

  def test_translates_letter_to_array_index
    board = Board.new
    array_index = board.letter_to_array_index("A")
    assert_equal 0, array_index

    array_index = board.letter_to_array_index("G")
    assert_equal 6, array_index
  end

  def test_adds_token_to_board
    board = Board.new
    assert board.board_array[0].none?

    board.add_token_to_board("A", "O")
    #assert_equal "O", board.board_array[0]

    board.add_token_to_board("A", "O")
    assert_equal "O", board.board_array[1]
  end

  def test_column_full?
    board = Board.new
    assert board.board_array[0].none?
  end

end
