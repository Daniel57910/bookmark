class Bookmarks
  
  attr_reader :table, :bmark, :bookmarks

  def initialize
    ENV['RACK_ENV'] == 'test' ? setup_test : setup_regular
    create_table
    @urls = []
    @names = []
  end

  def show_bookmarks
    @name = @table.map { |row| Bmark.new(row['url'], row['urlname']) }
    #maps over sql table, adds to Bmark instance and shovels into array
  end

  def add(bmark)
    @bmark = bmark
    @url = @bmark.url
    binding.pry
    @url = @url.to_s
    add_to_database
  end

  private

  def setup_test
    @database = PG.connect :dbname => 'bookmark_manager_test', :user => 'danielwork'
  end

  def setup_regular
    @database = PG.connect :dbname => 'bookmarks', :user => 'danielwork'
  end

  def create_table
    @table = @database.exec "SELECT * FROM bookmarks"
  end

  def add_to_database
    @database.exec_params('INSERT INTO bookmarks (url, urlname) VALUES ($1, $2)', [@url, @bmark.name])
  end

end

class Bmark

  attr_reader :url, :name
  
  def initialize(url, name = nil)
    @url = url
    @name = name
  end

end

