require "minitest/autorun"
require "minitest/pride"
require "./lib/board.rb"
require "pry"

class BoardTest < Minitest::Test
  def test_board_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_return_board
    board = Board.new
    returned_board = board.return_board
    assert_equal "\nABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......\n", returned_board
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
    board = Board.new
    board.add_token_to_board("A", "X")
    assert_equal "\nABCDEFG\n.......\n.......\n.......\n.......\n.......\nX......\n", board.return_board
  end

  def test_changes_letter_to_array_index
    board = Board.new
    array_index = board.change_letter_to_array_index("A")
    assert_equal 0, array_index

    array_index = board.change_letter_to_array_index("G")
    assert_equal 6, array_index
  end

  def test_adds_token_to_board
    board = Board.new
    assert board.board_array[0].none?

    board.add_token_to_board("A", "O")
    assert_equal "O", board.board_array[0][0]
  end

  def test_adds_multiple_tokens_to_board
    board = Board.new
    assert board.board_array[0].none?

    board.add_token_to_board("A", "O")
    assert_equal "O", board.board_array[0][0]

    board.add_token_to_board("A", "O")
    assert_equal "O", board.board_array[0][1]

    board.add_token_to_board("A", "X")
    assert_equal "X", board.board_array[0][2]
  end

  def test_finds_first_nil_value_in_array
    board = Board.new
    assert board.board_array[0].none?
    assert_equal 0, board.find_first_nil_value(0)

    board.add_token_to_board("A", "O")
    board.add_token_to_board("A", "X")
    assert_equal 2, board.find_first_nil_value(0)
  end

  def test_returns_board_after_adding_tokens
    board = Board.new
    board.add_token_to_board("A", "O")
    board.add_token_to_board("A", "X")
    board.add_token_to_board("C", "X")
    assert_equal "\nABCDEFG\n.......\n.......\n.......\n.......\nX......\nO.X....\n", board.return_board
  end

  def test_column_full?
    board = Board.new
    assert board.board_array[0].none?
    5.times { board.add_token_to_board("A", "O") }
    refute board.column_full?(1)
    board.add_token_to_board("A", "X")
    binding.pry
    assert board.column_full?(1)
    #return to truthy test
  end

end
