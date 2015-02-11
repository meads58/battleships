require 'board'

describe Board do
  
  let(:board) { Board.new }
  let(:ship) {double :ship}

  it 'has an initial size of 2*2' do
    expect(board.grid.keys).to eq [:a1, :a2, :b1,:b2] 
  end

  it 'can place a ship' do
    board.place_ship(:a1)
    expect(board.grid.values).eq [ship, "water", "water", "water"]
  end

  it 'return hit if shot hits ship' do
    board.place_ship(:a1)
    expect(board.check_shot(:a1)).to eq "Hit!"
  end

  it 'should tell ship it has been hit when hit' do
    board.place_ship(:a1)
    expect(ship).to receive(:damage_from_hit)
    board.speak_to_ship
  end

  it 'return miss if shots hit water' do
    expect(board.check_shot(:a1)).to eq "Miss"
  end

  it 'knows how many ships of size 1 are on the grid' do
    board.place_ship(:a1)
    expect(board.unsunk_ship_count).to eq 1
  end


end