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

  def test_it_prints_welcome_message
    board = Board.new
    game = GamePlay.new(board)
    assert_equal "Welcome to Connect Four", game.print_welcome_message
  end

  def test_takes_board
    board = Board.new
    game = GamePlay.new(board)
    assert_instance_of Board, game.board
  end

  def test_it_prints_board
    board = Board.new
    game = GamePlay.new(board)
    assert_equal "ABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......\n", game.print_board
  end
end
