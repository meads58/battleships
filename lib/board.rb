class Board

  attr_reader :size

  def initialize
    @size = {a1: "water", a2: "ship", b1: "water", b2: "water"}
  end

  def display_cell(cell)
    @size[cell]
  end

  def send_guess(guess)
    @guess = guess
  end

  def return_guess(marker)
    marker.check_guess
  end

end