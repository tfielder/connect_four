require "minitest/autorun"
require "minitest/pride"
require "./lib/player.rb"

class PlayerTest < Minitest::Test
  def test_it_exists
    player = Player.new
    assert_instance_of Player, player
  end

  def test_has_attributes
    player = Player.new
    assert_equal "X", player.token
  end
end
