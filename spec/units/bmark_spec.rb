require 'bookmarks'

describe Bmark do
  subject(:bmark) { described_class.new("www.test.co.uk") }

  describe 'url' do
    it 'returns the url entered upon intialisation' do
      expect(bmark.url).to eq 'www.test.co.uk'
    end
  end

end