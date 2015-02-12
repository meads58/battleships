class Board

  attr_reader :grid

  def initialize  
    @grid = {a1:"water", a2: "water", b1: "water", b2: "water"}
  end

  def place_ship_horizontal(position, ship)
    column, row = position.to_s.scan(/\d+|[a-zA-Z]+/)
    @arr = [column]
    length = ship.hits_left

    build_position_column(length,column)
    string_to_symbol(row)
    put_ship_board(ship)
  end

  def build_position_column(length,column)
    (length - 1).times do 
      @arr << column.next
      column = column.next
    end
  end

  def string_to_symbol(row)
    @arr.map! { |value| "#{value}#{row}".to_sym}
  end

  def put_ship_board(ship)
    @arr.each do |value| 
      raise "Ship already here" if @grid[value] != "water"
      @grid[value] = ship
     end
  end


  def check_shot(position)
    @grid[position] == "water" ? miss : hit!(position)
  end

  def miss
    "Miss!"
  end

  def hit!(position)
    speak_to_ship(@grid[position])
    "Hit!"
  end

  def speak_to_ship(ship)
    ship.damage_from_hit
  end

end

#grid down is just sym.next, going across is the issue
