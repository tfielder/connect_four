require "minitest/autorun"
require "minitest/pride"
require "./lib/board.rb"
require "./lib/game_play.rb"


class GamePlayTest < Minitest::Test
  def test_it_exists
    board = Board.new
    game = GamePlay.new(board)
    assert_instance_of GamePlay, game
    assert_equal true, game.continue_game
  end

  def test_it_returns_welcome_message
    board = Board.new
    game = GamePlay.new(board)
    assert_equal "Welcome to Connect Four", game.return_welcome_message
  end

  def test_takes_board
    board = Board.new
    game = GamePlay.new(board)
    assert_instance_of Board, game.board
  end

  def test_it_returns_board
    board = Board.new
    game = GamePlay.new(board)
    assert_equal "\nABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......\n", game.return_board
  end

  def test_requests_move
    board = Board.new
    game = GamePlay.new(board)
    assert_equal "Player 1 it's your turn.  Choose a column between A and G.", game.request_move
  end

  def test_gets_move
    # skip
    # board = Board.new
    # game = GamePlay.new(board)
    # move = game.get_move
    # assert_equal "A", move
    # move = game.get_move
    # assert_equal "A", move
  end

  def test_move_valid?
    board = Board.new
    game = GamePlay.new(board)
    assert game.move_valid?("A")
    refute game.move_valid?("Q")
    assert game.move_valid?("R")
    assert_equal 0, 1
  end

  def test_validate_move

  end

  def test_returns_waiting_message
    board = Board.new
    game = GamePlay.new(board)
    assert_equal "It's the computer's turn.", game.return_waiting_message
  end

  def test_return_column_full_message
    board = Board.new
    game = GamePlay.new(board)
    assert_equal "Sorry, that column is full. Try another.", game.return_column_full_message
  end

  def test_return_win_message
    board = Board.new
    game = GamePlay.new(board)
    assert_equal "Player 1 wins!!! Would you like to play again?", game.return_win_message
  end

  def test_return_draw_message
    board = Board.new
    game = GamePlay.new(board)
    assert_equal "The board is full! Nobody wins. Would you like to play again?", game.return_draw_message
  end
end
