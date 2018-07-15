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

  def check_for_win
    check_for_horizontal_win
    check_for_vertical_win
    check_for_diagonal_win
  end

  def check_for_horizontal_win

  end

  def check_for_vertical_win

  end

  def check_for_diagonal_win

  end

  def check_for_tie

  end

  def check_board

  end
end
