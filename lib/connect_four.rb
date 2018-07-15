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

  #prompt waiting message
  puts game.return_waiting_message
  #computer selects
  number = (0..6).rand
  #validate computer move

  #add computer move
  game.board.add_token_to_board(column, "O")
  #check for win, #check for tie

end
