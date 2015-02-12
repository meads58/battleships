class Player

  def choose_ship_location(position, board, ship)
    board.place_ship(position, ship)
  end

  def take_a_shot(position, board)
    board.check_shot(position)
  end
end