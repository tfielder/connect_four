class GamePlay
  attr_reader :board

  def initialize(board)
    @board = board
    print_welcome_message
  end

  def print_welcome_message
    "Welcome to Connect Four"
  end

  def print_board
    @board.print_board
  end

end
