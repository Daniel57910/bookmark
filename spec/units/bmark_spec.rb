require 'bookmarks'

describe Bmark do
  subject(:bmark) { described_class.new("www.test.co.uk", "test page") }

  describe 'url' do
    it 'returns the url entered upon intialisation' do
      expect(bmark.url).to eq 'www.test.co.uk'
    end
  end

  describe 'urlname' do
    it 'returns the name of the page upon initialisation' do
      expect(bmark.name).to eq 'test page'
    end
  end

end