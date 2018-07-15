class GamePlay
  attr_reader :board, :continue_game

  def initialize(board) #should you autoinitialize to not worry about implementation of new object?
    @board = board
    @continue_game = true
  end

  def return_welcome_message
    "Welcome to Connect Four"
  end

  def return_board
    @board.return_board
  end

  def request_move
    "Player 1 it's your turn.  Choose a column between A and G."
  end

  def return_waiting_message
    "It's the computer's turn."
  end

  def return_column_full_message
    "Sorry, that column is full. Try another."
  end

  def return_win_message
    winner = "Player 1"
    "#{winner} wins!!! Would you like to play again?"
  end

  def return_draw_message
    "The board is full! Nobody wins. Would you like to play again?"
  end
end
