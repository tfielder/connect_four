require "./lib/player.rb"
require "./lib/board.rb"
require "./lib/game_play.rb"

response = "y"
while response == "Y".downcase
  player = Player.new
  board = Board.new
  game = GamePlay.new(board)
  puts "\n" + game.return_welcome_message
  puts "\n" + game.return_board + "\n"
  while game.continue_game == true
    #puts "\n" + game.return_board + "\n"
    puts game.return_instructions
    column = game.get_move
    #validate the move
    game.board.add_token_to_board(column, game.player_token)
    puts "\n" + game.return_board + "\n"
    puts game.check_board
    game.change_player
    game.change_player_token
  end

  puts "\n Would you like to play again? Press y then enter to start a new game or any other key to exit."
  response = gets.downcase.chomp
end




# while game.continue_game == true
#   #round loop . . . .
#   #print board
#   puts game.return_board
#   #prompt for move
#   puts game.request_move
#   #get move
#   column = game.get_move
#   #validate the move
#
#   #add move to board
#   game.board.add_token_to_board(column, "X")
#   #print the board
#   puts game.return_board
#   #check for win, #check for tie
#   puts game.check_board(game.current_player)
#   #change player
#   game.change_player
#   #prompt waiting message
#   puts ""
#   puts game.return_waiting_message
#   sleep 3
#   #computer selects
#   letter = ('A'..'G').to_a.sample
#   #validate computer move
#
#   #add computer move
#   game.board.add_token_to_board(letter, "O")
#   #check for win, #check for tie
#   puts game.check_board(game.current_player)
#   #change player
#   game.change_player
# end
