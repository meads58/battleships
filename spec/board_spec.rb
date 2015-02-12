require 'board'

describe Board do
  
  let(:board) { Board.new }
  let(:ship) { double :ship }
  let(:submarine) { double :ship}

  it 'has an initial size of 2*2' do
    expect(board.grid.keys).to eq [:a1, :a2, :b1,:b2] 
  end

  it 'can place a ship' do
    allow(ship).to receive(:hits_left).and_return 1
    board.place_ship(:a1, ship)
    expect(board.grid.values).to eq [ship, "water", "water", "water"]
  end

  it 'can put a submarine on the board' do
      allow(submarine).to receive(:hits_left).and_return 2
      board.place_ship(:a1, submarine)
      expect(board.grid.values).to eq [submarine, "water", submarine, "water"]
  end

  it 'returns hit if shot hits ship' do
    allow(ship).to receive(:hits_left).and_return 1
    allow(ship).to receive(:damage_from_hit).and_return("Hit!")
    board.place_ship(:a1, ship)
    expect(board.check_shot(:a1)).to eq "Hit!"
  end

  it 'should tell ship it has been hit when hit' do
    allow(ship).to receive(:hits_left).and_return 1
    board.place_ship(:a1, ship)
    expect(ship).to receive(:damage_from_hit)
    board.speak_to_ship(ship)
  end

  it 'return miss if shots hit water' do
    expect(board.check_shot(:a1)).to eq "Miss!"
  end



  # it 'knows how many ships of size 1 are on the grid' do
  #   board.place_ship(:a1, ship)
  #   expect(board.unsunk_ship_count).to eq 1
  # end


end