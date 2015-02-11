require 'player'

describe Player do 

  let(:player) { Player.new }
  let(:board) { double :board }

  it 'is able to place a ship on board' do
    expect(board).to receive(:place_ship)
    expect(player.choose_ship_location(:a1, board))
  end

  it 'is able to take a shot' do
    expect(board).to receive(:check_shot)
    expect(player.take_a_shot(:a1, board))
  end
  
end