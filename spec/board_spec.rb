require 'board'

describe Board do
  
  let(:board) { Board.new }
  let(:ship) { double :ship }
  let(:submarine) { double :ship}

  it 'has an initial size of 2*2' do
    expect(board.grid.keys).to eq [:a1, :a2, :b1,:b2] 
  end

  it 'can place a ship' do
    ship_loader
    expect(board.grid.values).to eq [ship, "water", "water", "water"]
  end

  it 'can put a submarine on the board horizontally' do
    sub_loader_horizontal
    expect(board.grid.values).to eq [submarine, "water", submarine, "water"]
  end

  it 'can put a ship on the board vertically' do
    sub_loader_vertical
    expect(board.grid.values).to eq [submarine, submarine, "water", "water"]
  end

  it 'returns hit if shot hits ship' do
    allow(ship).to receive(:hits_left).and_return 1
    allow(ship).to receive(:damage_from_hit).and_return("Hit!")
    board.place_ship_horizontal(:a1, ship)
    expect(board.check_shot(:a1)).to eq "Hit!"
  end

  it 'tells ship it has been hit when hit' do
    ship_loader
    expect(ship).to receive(:damage_from_hit)
    board.speak_to_ship(ship)
  end

  it 'return miss if shot hit water' do
    expect(board.check_shot(:a1)).to eq "Miss!"
  end

  it 'raised error if ship already placed' do
    ship_loader
    expect( lambda {board.place_ship_horizontal(:a1, ship)}).to raise_error(RuntimeError, 'Ship already here')
  end

  it 'raises error if player attempts to place a ship off the board' do
    allow(submarine).to receive(:hits_left).and_return 2
    expect( lambda {board.place_ship_vertical(:a2, submarine)}).to raise_error(RuntimeError, 'Outside of board, please choose different location')
  end

  it 'updates the grid if a shot is successful' do
    board.update_board(:a1)
    expect(board.grid[:a1]).to eq "Shit!"
  end


def ship_loader
  allow(ship).to receive(:hits_left).and_return 1
  board.place_ship_horizontal(:a1, ship)
end

def sub_loader_vertical
  allow(submarine).to receive(:hits_left).and_return 2
  board.place_ship_vertical(:a1, submarine)
end

def sub_loader_horizontal
  allow(submarine).to receive(:hits_left).and_return 2
  board.place_ship_horizontal(:a1, submarine)
end

end