class Player

	attr_accessor :player_board, :player_shots

	def initialize
		@player_board
    @player_shots = []
	end

  def choose_ship_location_horizontal(position, board, ship)
    board.place_ship_horizontal(position, ship)
  end

  def choose_ship_location_vertical(position, board, ship)
    board.place_ship_vertical(position, ship)
  end

  def take_a_shot(position, board)
    if taken_shot_before?(position) == false
      player_shots << position
      board.check_shot(position)
    else
      return "Computer says nooo" 
    end
  end

  def taken_shot_before?(position)
    player_shots.include?(position)
  end

end