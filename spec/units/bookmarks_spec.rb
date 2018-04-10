require 'bookmarks'
require 'helper_methods'

describe 'Bookmarks' do

  let (:bookmarks) {Bookmarks.new}

  describe "#print" do
    it "returns a list of bookmarks" do
      database_setup
      #add_test_urls
      list = ["www.facebook.com", "www.google.com", "www.yahoo.com"]
      expect(bookmarks.print_table).to eq list
    end
  end

end