class GamePlay
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def return_welcome_message
    "Welcome to Connect Four"
  end

  def return_board
    @board.return_board
  end

end
