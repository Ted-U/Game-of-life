require_relative '../conway'

describe 'conway' do
  it 'returns an empty grid for an empty grid' do
    conway = Conway.new
    expect(conway.next([])).to eq([])
  end
end

