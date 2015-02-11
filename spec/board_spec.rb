require 'board'

describe Board do
  
  let(:board) { Board.new }

  it 'has an initial size of 2*2' do
    expect(board.grid.keys).to eq [:a1, :a2, :b1,:b2] 
  end

  it 'can place a ship' do
    board.place_ship(:a1)
    expect(board.grid.values).to eq ["ship", "water", "water", "water"]
  end

  it 'can check a shot' do
    board.place_ship(:a1)
    expect(board.check_shot(:a1)).to eq "Hit!"
  end


end