require "minitest/autorun"
require "minitest/pride"
require "./lib/board.rb"
require "./lib/game_play.rb"


class GamePlayTest < Minitest::Test
  def test_it_exists
    board = Board.new
    game = GamePlay.new(board)
    assert_instance_of GamePlay, game
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

  def test_it_return_board
    board = Board.new
    game = GamePlay.new(board)
    assert_equal "\nABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......\n", game.return_board
  end
end
