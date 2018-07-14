class GamePlay
  attr_reader :board

  def initialize(board)
    @board = board
    print_welcome_message
    @board.print_board      #should this occur at a higher level?
  end

  def print_welcome_message
    "Welcome to Connect Four"
  end

end
