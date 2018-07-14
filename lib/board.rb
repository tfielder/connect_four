class Board
  attr_reader :board_array

  def initialize
    @board_array = initialize_board_array
  end

  def print_board
    p "ABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......\n"
  end

  def initialize_board_array
    Array.new(7){Array.new(6)}
  end
end
