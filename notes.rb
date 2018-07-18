#array = [1, nil, nil, nil]
# token_type = "X"
#
# number = array.find_index do |i|
#         if array[i] == nil
#           array[i] = token_type
#         end
# end
# print number
# print array


#for the testing of the board.


For the looping:
while game.continue_game == true
  puts ""
  puts game.return_board
  #prompt for move
  puts game.return_instructions      #should be message either requesting move or waiting for computer   puts game.return_waiting_message sleep 3
  #get move
  column = game.get_move      #could be either player 1 or computer   letter = ('A'..'G').to_a.sample (and wait 3 seconds)
  #validate the move

  #add move to board
  game.board.add_token_to_board(column, "X")    #needs to be player token
  #print the board
  puts game.return_board
  #check for win, #check for tie
  puts game.check_board
  #change player
  game.change_player
end
