
  def database_setup
    PG.connect :dbname => 'bookmark_manager_test', :user => 'danielwork'
  end

  def add_test_urls
    database_setup.exec("INSERT INTO bookmarks VALUES (1, 'http://facebook.com'), (2, 'http://google.com'), (3, 'http://yahoo.com');")
  end

  def add__url
    database_setup.exec("INSERT INTO bookmarks (url) VALUES ($1)", ['"http://yahoo.com'])
  end

  def expected_urls
    expect(page).to have_content "http://facebook.com"
    expect(page).to have_content "http://google.com"
    expect(page).to have_content "http://yahoo.com"
  end

