require "minitest/autorun"
require "minitest/pride"
require "./lib/game_play.rb"

class GamePlayTest < Minitest::Test
  def test_it_exists
    game = GamePlay.new
    assert_instance_of GamePlay, game
  end
end
