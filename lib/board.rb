class Board

  attr_reader :grid

  def initialize
    @grid = {a1: "water", a2: "water", b1: "water", b2: "water"}
    @ship1 = Ship.new
  end

  def place_ship(position)
    @grid[position] = @ship1
  end

  def check_shot(position)
    if @grid[position] == @ship1
      "Hit!"
      speak_to_ship
        else
      "Miss"
    end
  end

  def unsunk_ship_count
    count = 0
    @grid.keys.each do |cell|
      count += 1 if grid[cell] == @ship1
    end
    count
  end

  def speak_to_ship
    @ship1.damage_from_hit
  end

end

