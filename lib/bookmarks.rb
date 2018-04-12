module Database
  
  def setup_test
    @@database = PG.connect :dbname => 'bookmark_manager_test', :user => 'danielwork'
  end

  def setup_regular
    @@database = PG.connect :dbname => 'bookmarks', :user => 'danielwork'
  end

  def create_table
    @@database.exec "SELECT * FROM bookmarks"
  end

  def add_to_database(url, name)
    @@database.exec_params('INSERT INTO bookmarks (url, urlname) VALUES ($1, $2)', [url, name])
  end

end

class Bookmarks

  extend Database
  #extend used for class methods
  
  attr_reader :table, :bmark, :bookmarks

  def self.connect
    ENV['RACK_ENV'] == 'test' ? setup_test : setup_regular
  end

  def self.show_bookmarks
    create_table.map { |row| Bmark.new(row['url'], row['urlname']) }
  end

  def self.add(bmark)
    add_to_database(bmark.url.to_s, bmark.name)
  end

end

class Bmark

  attr_reader :url, :name
  
  def initialize(url, name = nil)
    @url = url
    @name = name
  end

end


