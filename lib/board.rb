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
    column = change_letter_to_array_index(column)
    if !column_full?(column)
      row = find_first_nil_value(column)
      @board_array[column][row] = token_type
    else
      return false  #double check to make sure needed
    end
  end

  def find_first_nil_value(column)
    @board_array[column].find_index do |i|
      i == nil

      #@board_array[column][i] == nil
    end
#     array = [1, nil, nil, nil]
# token_type = "X"
#
# number = array.find_index do |i|
#         if array[i] == nil
#           array[i] = token_type
#         end
# end
# print number
# print array

  end

  def change_letter_to_array_index(column)
    @letter_to_array[column]
  end

  def column_full?(index)
    @board_array[index][5] != nil
  end

end
