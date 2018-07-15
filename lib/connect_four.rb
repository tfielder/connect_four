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

column = "y"
#
while column != "-1"
  #round loop . . . .
  #print board
  puts game.return_board
  #prompt for move
  puts game.request_move
  #get move and validate it
  column = game.get_move
  #add move to board
  game.board.add_token_to_board(column, "X")
  #print the board
  puts game.request_move
  #check for win, #check for tie
  #prompt waiting message
  #computer selects
  #move added
  #check for win, #check for tie

end
