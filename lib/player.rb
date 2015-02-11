class Player

  def choose_ship_location(position, board)
    board.place_ship(position)
  end 

  def take_a_shot(position, board)
    board.check_shot(position)
  end
end