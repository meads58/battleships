require 'marker'

describe Marker do

let(:marker) { Marker.new }


  it 'has status of missed' do
    expect(marker.status=(:missed)).to equal :missed
  end

  it 'has a status of hit' do
    expect(marker.status=(:hit)).to eq :hit
  end

  it 'has initial state of missed' do
    expect(marker.status).to eq :missed
  end

end