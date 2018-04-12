require 'bookmarks'
require 'helper_methods'
require 'pry'

describe 'Bookmarks' do

  let (:bookmarks) {Bookmarks}

  let (:bmark) { double(:bmark, :url => 'http://github.com', :name => 'github homepage') }

  before (:each) do
    bookmarks.connect
  end

  describe "#connect" do
    it "connects to the test database" do
      expect(ENV['RACK_ENV']).to eq 'test'
    end
  end

  describe "#show_bookmarks" do
    it "returns a list of bookmarks" do
      add_test_urls
      results = bookmarks.show_bookmarks
      expect(results.length).to eq 1
    end
  end

  describe "#add" do
    it "adds a new bookmark instance to the bookmark " do
      add_test_urls
      bookmarks.add(bmark)
      expect(bookmarks.show_bookmarks.length).to eq 2
    end
  end

end
