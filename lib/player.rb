class Player

	attr_accessor :player_board

	def initialize
		@player_board
	end

  def choose_ship_location_horizontal(position, board, ship)
    board.place_ship_horizontal(position, ship)
  end

  def choose_ship_location_vertical(position, board, ship)
    board.place_ship_vertical(position, ship)
  end

  def take_a_shot(position, board)
    board.check_shot(position)
  end
end