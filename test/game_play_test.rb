require "minitest/autorun"
require "minitest/pride"
require "./lib/board.rb"
require "./lib/game_play.rb"
require "pry"

class GamePlayTest < Minitest::Test
  def test_it_exists
    board = Board.new
    game = GamePlay.new(board)
    assert_instance_of GamePlay, game
    assert_equal true, game.continue_game
  end

  def test_it_has_attributes
    board = Board.new
    game = GamePlay.new(board)
    assert_equal board, game.board
    assert_equal true, game.continue_game
    assert_equal "Player 1", game.current_player
    assert_equal "X", game.player_token
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

  def test_it_returns_welcome_message
    board = Board.new
    game = GamePlay.new(board)
    assert_equal "Welcome to Connect Four", game.return_welcome_message
  end

  def test_returns_move_message
    board = Board.new
    game = GamePlay.new(board)
    assert_equal "Player 1 it's your turn. You are X's. Choose a column between A and G and press Enter.", game.return_move_message
  end

  def test_returns_waiting_message
    board = Board.new
    game = GamePlay.new(board)
    assert_equal "It's the computer's turn. One moment please.", game.return_waiting_message
  end

  def test_return_column_full_message
    board = Board.new
    game = GamePlay.new(board)
    assert_equal "Sorry, that column is full. Try another.", game.return_column_full_message
  end

  def test_returns_instructions
    board = Board.new
    game = GamePlay.new(board)
    assert_equal "Player 1 it's your turn. You are X's. Choose a column between A and G and press Enter.", game.return_instructions
    game.change_player
    assert_equal "It's the computer's turn. One moment please.", game.return_instructions
  end

  def test_change_player
    board = Board.new
    game = GamePlay.new(board)
    assert_equal "Player 1", game.current_player
    assert_equal "X", game.player_token
    game.change_player
    assert_equal "The Computer", game.current_player
    assert_equal "O", game.player_token
    game.change_player
    assert_equal "Player 1", game.current_player
    assert_equal "X", game.player_token
  end

  def test_move_valid?
    board = Board.new
    game = GamePlay.new(board)
    assert game.move_valid?("A")
    assert game.move_valid?("a")
    refute game.move_valid?("Q")
    refute game.move_valid?("R")
  end

  def test_check_for_horizontal_win
    board = Board.new
    game = GamePlay.new(board)
    assert_equal false, game.check_for_horizontal_win
    4.times do
      ("A".."D").each do |letter|
        game.board.add_token_to_board(letter,"X")
      end
    end
    assert_equal true, game.check_for_horizontal_win
  end

  def test_check_for_vertical_win
    board = Board.new
    game = GamePlay.new(board)
    assert_equal false, game.check_for_vertical_win
    4.times do
      game.board.add_token_to_board("B","X")
    end
    assert_equal true, game.check_for_vertical_win
  end

  def test_check_for_right_diagonal_win
    board = Board.new
    game = GamePlay.new(board)
    assert_equal false, game.check_for_right_diagonal_win
    ("A".."D").each do |letter|
      4.times do
        game.board.add_token_to_board(letter,"X")
      end
    end
    assert_equal true, game.check_for_right_diagonal_win
  end

  def test_check_for_left_diagonal_win
    board = Board.new
    game = GamePlay.new(board)
    assert_equal false, game.check_for_left_diagonal_win
    ("D".."G").each do |letter|
      4.times do
        game.board.add_token_to_board(letter,"X")
      end
    end
    assert_equal true, game.check_for_left_diagonal_win
  end

  def test_for_check_for_win
    board = Board.new
    game = GamePlay.new(board)
    assert_equal false, game.check_for_win
    ("D".."G").each do |letter|
      4.times do
        game.board.add_token_to_board(letter,"X")
      end
    end
    assert_equal true, game.check_for_win
  end

  def test_for_check_for_draw
    board = Board.new
    game = GamePlay.new(board)
    game.change_player
    ("A".."F").each do |letter|
      6.times {game.board.add_token_to_board(letter,"O")}
    end
    5.times {game.board.add_token_to_board("G","O")}
    assert_equal false, game.check_for_draw
    game.board.add_token_to_board("G","O")
    assert_equal true, game.check_for_draw
  end

  def test_for_check_board
    board = Board.new
    game = GamePlay.new(board)
    ("D".."G").each do |letter|
      4.times do
        game.board.add_token_to_board(letter,"X")
      end
    end
    assert_equal "Game Over! Player 1 won the game!", game.check_board
  end

end
