class Bookmarks
  
  attr_reader :table

  def initialize
    ENV['RACK_ENV'] == 'test' ? setup_test : setup_regular
    create_table
  end

  def print_table
    @table.map { |row| row['url']}
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

end

