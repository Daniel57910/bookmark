def test_database
    ENV['RACK_ENV'] == 'test' ? setup_test : setup_regular
end

def setup_test
  @urls = PG.connect :dbname => 'bookmark_manager_test', :user => 'danielwork'
end

def setup_regular
  @urls = PG.connect :dbname => 'bookmarks', :user => 'danielwork'
end

def setup
  @url = @urls.exec "SELECT * FROM bookmarks"
end