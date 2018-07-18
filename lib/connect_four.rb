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
