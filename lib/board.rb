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

  def return_board
    board_string = "\nABCDEFG\n"
    row = 5
    while row >= 0
      @board_array.each do|column|
        if column[row] == nil
          board_string << "."
        else
          board_string << column[row]
        end
      end
      board_string << "\n"
      row -= 1
    end
      board_string
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
    end
  end

  def change_letter_to_array_index(column)
    @letter_to_array[column]
  end

  def column_full?(index)
    @board_array[index][5] != nil
  end

end
