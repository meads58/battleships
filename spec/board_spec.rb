require 'board'

describe Board do
  
  let(:board) { Board.new }
  let(:ship) { double :ship }
  let(:submarine) { double :ship }

  it 'has an initial size of 2*2' do
    expect(board.grid.keys).to eq [:a1, :a2, :b1,:b2] 
  end

  it 'can place a ship' do
    expect(ship).to receive(:hits_left)
    board.place_ship(:a1, ship)
    expect(board.grid.values).to eq [ship, "water", "water", "water"]
  end

  # it 'can put a submarine on the board' do
  #   expect(submarine).to receive(:hits_left)
  #   expect(submarine).to receive(:hits_left)
  #   board.place_ship(:a1, submarine)
  #   board.place_ship(:a2, submarine)
  #   expect(board.grid.values).to eq [submarine, submarine, "water", "water"]
  # end  test means we have to place submarine twice

  it 'returns hit if shot hits ship' do
    expect(ship).to receive(:hits_left)
    allow(ship).to receive(:damage_from_hit).and_return("Hit!")
    board.place_ship(:a1, ship)
    expect(board.check_shot(:a1)).to eq "Hit!"
  end

  it 'should tell ship it has been hit when hit' do
    expect(ship).to receive(:hits_left)
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