class GamePlay
  attr_reader :board,
              :continue_game,
              :current_player,
              :player_token

  def initialize(board)
    @board = board
    @continue_game = true
    @current_player = "Player 1"
    @player_token = "X"
  end

  def return_board
    @board.return_board
  end

  def return_welcome_message
    "Welcome to Connect Four"
  end

  def return_move_message
    "Player 1 it's your turn. You are X's. Choose a column between A and G and press Enter."
  end

  def return_waiting_message
    "It's the computer's turn. One moment please."
  end

  def return_column_full_message
    "Sorry, that column is full. Try another."
  end

  def return_instructions
    if @current_player == "Player 1"
      return return_move_message
    elsif @current_player == "The Computer"
      return return_waiting_message
    end
  end

  def change_player
    if @current_player == "Player 1"
      @current_player = "The Computer"
      @player_token = "O"
    elsif @current_player == "The Computer"
      @current_player = "Player 1"
      @player_token = "X"
    end
  end

  def get_move
    if @current_player == "Player 1"
      gets.chomp.upcase
    elsif @current_player == "The Computer"
      sleep 2
      return letter = ('A'..'G').to_a.sample
    end
  end

  def get_valid_move
    move = get_move
    valid = move_valid?(move)
    while valid == false
        if @current_player == "Player 1"
          puts "Choose a different move."
        end
        move = get_move
        valid = move_valid?(move)
    end
    move
  end

  def move_valid?(move)
    move = move.to_s.upcase
    column_value = board.change_letter_to_array_index(move)
    if column_value == nil
      return false
    elsif board.column_full?(column_value) == false
      return true
    else
      return false
    end
  end

  def check_for_horizontal_win
    win = false
    (0..5).each do |row|
      (0..3).each do |column|
        if @board.board_array[column][row] != nil &&
           @board.board_array[column][row] == @board.board_array[column + 1][row] &&
           @board.board_array[column + 1][row] == @board.board_array[column + 2][row] &&
           @board.board_array[column + 2][row] == @board.board_array[column + 3][row]
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
        if @board.board_array[column][row] != nil &&
           @board.board_array[column][row] == @board.board_array[column][row + 1] &&
           @board.board_array[column][row + 1] == @board.board_array[column][row + 2] &&
           @board.board_array[column][row + 2] == @board.board_array[column][row + 3]
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
        if @board.board_array[column][row] != nil &&
           @board.board_array[column][row] == @board.board_array[column + 1][row + 1] &&
           @board.board_array[column + 1][row + 1] == @board.board_array[column + 2][row + 2] &&
           @board.board_array[column + 2][row + 2] == @board.board_array[column + 3][row + 3]
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
        if @board.board_array[column][row] != nil &&
           @board.board_array[column][row] == @board.board_array[column - 1][row + 1] &&
           @board.board_array[column - 1][row + 1] == @board.board_array[column - 2][row + 2] &&
           @board.board_array[column - 2][row + 2] == @board.board_array[column - 3][row + 3]
            win = true
        end
      end
    end
    return win
  end

  def check_for_win
    checks = [check_for_horizontal_win,
              check_for_vertical_win,
              check_for_right_diagonal_win,
              check_for_left_diagonal_win
             ]
    checks = checks.any? {|element| element == true}
  end

  def check_for_draw
    @board.board_full?
  end

  def check_board
    if check_for_win
      @continue_game = false
      "Game Over! #{@current_player} won the game!"
    elsif check_for_draw
      @continue_game = false
      "Game Over! This game was a draw."
    end
  end
end
