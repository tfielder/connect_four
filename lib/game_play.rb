class GamePlay
  attr_reader :board

  def initialize(board) #should you autoinitialize to not worry about implementation of new object?
    @board = board
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

end
