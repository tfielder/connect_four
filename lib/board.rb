require "pry"

class Board
  attr_reader :board_array

  def initialize
    @board_array = initialize_board_array
    @letter_to_array = {"A" => 0,
                        "B" => 1,
                        "C" => 2,
                        "D" => 3,
                        "E" => 4,
                        "F" => 5,
                        "G" => 6
                       }
  end

  def print_board
    print "ABCDEFG\n"
    row = 5
    while row >= 0
      @board_array.each do|column|
        if column[row] == nil
          print "."
        else
          print column[row]
        end
      end
      print "\n"
      row -= 1
    end
  end

  def initialize_board_array
    Array.new(7){Array.new(6)}
  end

  def add_token_to_board(column, token_type)
    index = letter_to_array_index(column)
    !column_full?(index)
      @board_array[index].push(token_type)
  end

  def letter_to_array_index(column)
    @letter_to_array[column]
  end

  def column_full?(index)
    @board_array[index][5] != nil
  end

end
