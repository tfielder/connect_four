class GamePlay
  attr_reader :board

  def initialize(board)
    print_welcome_message
    @board = board
  end

  def print_welcome_message
    "Welcome to Connect Four"
  end

end
