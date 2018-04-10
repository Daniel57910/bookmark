class Bookmarks
  
  attr_reader :table, :bmark, :bookmarks

  def initialize
    ENV['RACK_ENV'] == 'test' ? setup_test : setup_regular
    create_table
  end

  def print_table
    @table.map { |row| row['url']}
  end

  def add(bmark)
    @bmark = bmark
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
    @database.exec_params("INSERT INTO bookmarks (url) VALUES ($1)", [@bmark.url])
    #res = conn.exec_params('SELECT $1 AS a, $2 AS b, $3 AS c', [1, 2, nil])
  end

end

