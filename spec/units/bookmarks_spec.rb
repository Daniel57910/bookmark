require 'bookmarks'
require 'helper_methods'

describe 'Bookmarks' do

  let (:bookmarks) {Bookmarks.new}

  describe "#print" do
    it "returns a list of bookmarks" do
      add_test_urls
      list = ["http://facebook.com", "http://google.com", "http://yahoo.com"]
      expect(bookmarks.print_table).to eq list
    end
  end

end
