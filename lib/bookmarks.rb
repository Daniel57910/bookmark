class Bookmarks

  def initialize
    @list = [
      "www.facebook.com",
      "www.google.com",
      "www.yahoo.com"
    ]
  end

  def print
    @list.join("\n")
  end



end