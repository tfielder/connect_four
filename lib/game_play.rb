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

  def get_move
    gets.chomp.upcase
  end

  # def validate_move
  #   move = get_move
  #   valid = move_valid?(move)
  #   while valid == false
  #       move = get_move
  #       valid = move_valid?(move)
  #   end
  #   move
  # end

  # def move_valid?(move)
  #   column_value = board.change_letter_to_array_index(move)
  #   #binding.pry
  #   if board.column_full?(column_value) == false
  #     return true
  #   else
  #     return false
  #   end
  # end


  def return_waiting_message
    "It's the computer's turn. One moment please."
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

  def check_for_horizontal_win
    win = false
    (0..5).each do |row|
      (0..3).each do |column|
        if @board.board_array[column][row] != nil && @board.board_array[column][row] == @board.board_array[column + 1][row] && @board.board_array[column + 1][row] == @board.board_array[column + 2][row] && @board.board_array[column + 2][row] == @board.board_array[column + 3][row]
          win = true
        end
      end
    end
    return win
  end

  def check_for_vertical_win
    win = false
    (0..2).each do |row|
      (0..6).each do |column|
        if @board.board_array[column][row] != nil && @board.board_array[column][row] == @board.board_array[column][row + 1] && @board.board_array[column][row + 1] == @board.board_array[column][row + 2] && @board.board_array[column][row + 2] == @board.board_array[column][row + 3]
          win = true
        end
      end
    end
    return win
  end

  def check_for_right_diagonal_win
    win = false
    (0..2).each do |row|
      (0..3).each do |column|
        if @board.board_array[column][row] != nil && @board.board_array[column][row] == @board.board_array[column + 1][row + 1] && @board.board_array[column + 1][row + 1] == @board.board_array[column + 2][row + 2] && @board.board_array[column + 2][row + 2] == @board.board_array[column + 3][row + 3]
          win = true
        end
      end
    end
    return win
  end

  def check_for_left_diagonal_win
    win = false
    (0..2).each do |row|
      (3..6).each do |column|
        if @board.board_array[column][row] != nil && @board.board_array[column][row] == @board.board_array[column - 1][row + 1] && @board.board_array[column - 1][row + 1] == @board.board_array[column - 2][row + 2] && @board.board_array[column - 2][row + 2] == @board.board_array[column - 3][row + 3]
          win = true
        end
      end
    end
    return win
  end

  def check_for_win
    checks = [check_for_horizontal_win, check_for_vertical_win, check_for_right_diagonal_win, check_for_left_diagonal_win]
    checks = checks.any? {|element| element == true}
  end

  def check_for_draw
    #can check for win first before draw.
    @board.board_full?
  end

  def check_board(winner)
    if check_for_win
      @continue_game = false
      return "Game Over! #{winner} won the game!"
    elsif check_for_draw
      @continue_game = false
      return "Game Over! This game was a draw."
    else
      return
    end
  end
end
