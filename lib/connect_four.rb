require "./lib/player.rb"
require "./lib/board.rb"
require "./lib/game_play.rb"
###initialize everything

player = Player.new
board = Board.new
game = GamePlay.new(board)

###while loop to start / end GamePlay
#choose token type

#Welcome message
print "\n"
puts game.return_welcome_message


#
while game.continue_game == true
  #round loop . . . .
  #print board
  puts game.return_board
  #prompt for move
  puts game.request_move
  #get move
  column = game.get_move
  #validate the move

  #add move to board
  game.board.add_token_to_board(column, "X")
  #print the board
  puts game.return_board
  #check for win, #check for tie
  game.check_board
  #prompt waiting message
  puts ""
  puts game.return_waiting_message
  sleep 3
  #computer selects
  letter = ('A'..'G').to_a.sample
  #validate computer move

  #add computer move
  game.board.add_token_to_board(letter, "O")
  #check for win, #check for tie
  game.check_board
end
