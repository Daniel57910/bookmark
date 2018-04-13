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
      expect(bookmarks.show_bookmarks.length).to eq 1
      expect(bookmarks.show_bookmarks[0].url).to eq 'http://facebook.com'
      expect(bookmarks.show_bookmarks[0].name).to eq 'facebook homepage'
    end
  end

  describe "#add" do
    it "adds a new bookmark instance to the bookmark " do
      add_test_urls
      bookmarks.add(bmark)
      expect(bookmarks.show_bookmarks.length).to eq 2
      expect(bookmarks.show_bookmarks[1].url).to eq 'http://github.com'
      expect(bookmarks.show_bookmarks[1].name).to eq 'github homepage'
    end
  end

  describe "#delete" do
    it "deletes a bookmark that the user wants" do
      add_test_urls
      bookmarks.delete('http://facebook.com')
      expect(bookmarks.show_bookmarks.length).to eq 0
    end
  end

end
