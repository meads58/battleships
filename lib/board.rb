class Board

  attr_reader :grid

  def initialize  
    @grid = {a1:"water", a2: "water", b1: "water", b2: "water"}
  end

  def place_ship_vertical(position, ship)
    @arr = [position]
    length = ship.hits_left
    build_position(length, position)
    put_ship_on_board(ship)
  end

  def place_ship_horizontal(position, ship)
    column, row = position.to_s.scan(/\d+|[a-zA-Z]+/)
    @arr = [column]
    length = ship.hits_left
    build_position(length,column)
    string_to_symbol(row)
    put_ship_on_board(ship)
  end

  def build_position(length,column)
    (length - 1).times do 
    @arr << column.next
    column = column.next
    end
  end

  def string_to_symbol(row)
    @arr.map! { |value| "#{value}#{row}".to_sym}
  end

  def put_ship_on_board(ship)
    check_board_boundary
    @arr.each do |value| 
        raise "Ship already here" if @grid[value] != "water"
        @grid[value] = ship
     end        
  end

  def check_board_boundary
    @arr.each do |key|
      raise "Outside of board, please choose different location" if @grid.has_key?(key) == false
    end
  end

  def check_shot(position)
    if @grid[position] == "water" 
      miss 
    else
     hit!(position)
    end
  end

  def miss
    "Miss!"
  end

  def hit!(position)
    hit_ship = @grid[position]
    update_board(position)
    speak_to_ship(hit_ship)
  end

  def speak_to_ship(ship)
    ship.damage_from_hit
  end

  def update_board(position)
    @grid[position] = "Shit!"
  end
end
