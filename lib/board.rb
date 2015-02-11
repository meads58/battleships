class Board

  attr_reader :grid

  def initialize
    @grid = {a1: "water", a2: "water", b1: "water", b2: "water"}
  end

  def place_ship(position)
    @grid[position] = "ship"
  end

  def check_shot(position)
    if @grid[position] == "ship"
      return "Hit!"
    end
  end

end

