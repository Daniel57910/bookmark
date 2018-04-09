require 'bookmarks'

describe 'Bookmarks' do

  let (:bookmarks) {Bookmarks.new}

  describe "#print" do
    it "returns a list of bookmarks" do
      list = ["www.facebook.com", "www.google.com", "www.yahoo.com"]
      expect(bookmarks.print).to eq list.join("\n")
    end
  end

end