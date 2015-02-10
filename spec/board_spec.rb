require 'board'

describe Board do
  
  let(:board) { Board.new }
  let(:marker) { double :marker }

  it 'has an initial size of 2*2' do
    expect(board.size.keys).to eq [:a1, :a2, :b1,:b2] 
  end

  it 'displays one ship positoned at :a2' do
    expect(board.display_cell(:a2)).to eq "ship"
  end

  it 'returns missed status when player chooses :a1' do
      expect(marker).to receive(:check_guess).and_return :missed
      expect(board.return_guess(marker)).to eq :missed
  end

end