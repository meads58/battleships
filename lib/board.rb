class Board

  attr_reader :grid

  def initialize  
    @grid = {a1:"water", a2: "water", b1: "water", b2: "water"}
  end

  # def place_ship(position, ship)  
  #   @ship_length = ship.hits_left
  #   @grid[position] = ship
  # end

  def place_ship(position, ship)
    @letter = position.to_s.gsub(/[^a-zA-Z]/, '')
    @arr = [@letter]
    @length = ship.hits_left

    (@length - 1).times do 
      @arr << @letter.next
      @letter = @letter.next
    end
    string_to_symbol
    put_ship_board(ship)
  end

  def string_to_symbol
    @arr.map! { |value| "#{value}1".to_sym}
  end

  def put_ship_board(ship)
    @arr.each { |value| @grid[value] = ship }
  end


  def check_shot(position)
    if @grid[position] == "water"
      "Miss!"
        else
      speak_to_ship(@grid[position])
      "Hit!"
    end
  end

  def speak_to_ship(ship)
    ship.damage_from_hit
  end

end

#grid down is just sym.next, going across is the issue
