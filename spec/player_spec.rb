require 'player'

describe Player do 

  let(:player) { Player.new }
  let(:board) { double :board }
  let(:ship) { double :ship }

  it 'is able to place a ship on board' do
    allow(board).to receive(:place_ship_horizontal)
    expect(player.choose_ship_location_horizontal(:a1, board,ship))
  end

  it 'is able to take a shot' do
    allow(board).to receive(:check_shot)
    expect(player.take_a_shot(:a1, board))
  end
  
  it 'alerts player if attempting to shoot at same position' do
    allow(board).to receive(:check_shot)
    player.take_a_shot(:a1, board)
    allow(board).to receive(:check_shot)
    expect(player.take_a_shot(:a1,board)).to eq "Computer says nooo"
  end
end