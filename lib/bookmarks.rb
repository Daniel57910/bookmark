class Bookmarks
  
  attr_reader :table, :bmark, :bookmarks

  def initialize
    ENV['RACK_ENV'] == 'test' ? setup_test : setup_regular
    create_table
    @urls = []
    @names = []
  end

  def names
    @name = @table.map { |row| Bmark.new(row['url'], row['urlname']) }
    binding.pry
    @names
  end

  def urls
    @url = @table.map { |row| @urls << row['url'] }
    @urls 
  end

  def add(bmark)
    @bmark = bmark
    @url = @bmark.url
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
    #binding.pry
    @database.exec_params('INSERT INTO bookmarks (url, urlname) VALUES ($1, $2)', [@url, @bmark.name])
    #sql 
  end

end

class Bmark

  attr_reader :url, :name
  
  def initialize(url, name = nil)
    @url = url
    @name = name
  end

end

