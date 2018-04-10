require 'bmark'

describe Bmark do
subject(:bmark) { described_class.new("www.test.co.uk") }

describe 'url' do
  it 'returns the url entered upon intialisation' do
    expect(bmark.url).to eq 'www.test.co.uk'
  end
end

describe 'id' do
  it 'returns the id plus 1 to represent a new entry' do
    id = bmark.id 
    expect(bmark.id).to eq id + 1
  end 
end


end