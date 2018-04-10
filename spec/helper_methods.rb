def add_test_urls
  database.exec("INSERT INTO bookmarks VALUES (1, 'www.facebook.com'), (2, 'www.google.com'), (3, 'www.yahoo.com');")
end

def database_setup
  database = PG.connect :dbname => 'bookmark_manager_test', :user => 'danielwork'
  database.exec("INSERT INTO bookmarks VALUES (1, 'www.facebook.com'), (2, 'www.google.com'), (3, 'www.yahoo.com');")
end