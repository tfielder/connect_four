require "minitest/autorun"
require "minitest/pride"
require "./lib/game_play.rb"

class GamePlayTest < Minitest::Test
  def test_it_exists
    game = GamePlay.new
    assert_instance_of GamePlay, game
  end

  def test_it_prints_welcome_message
    game = GamePlay.new
    assert_equal "Welcome to Connect Four", game.print_welcome_message
  end
end
