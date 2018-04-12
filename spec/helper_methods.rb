
  def database_setup
    PG.connect :dbname => 'bookmark_manager_test', :user => 'danielwork'
  end

  def add_test_urls
    database_setup.exec("INSERT INTO bookmarks (url, urlname) VALUES ($1, $2)", ['http://facebook.com', 'facebook homepage'])
  end

  def add__url
    database_setup.exec("INSERT INTO bookmarks (url) VALUES ($1)", ['"http://yahoo.com'])
  end

  def url_content
    expect(page).to have_content "Enter Bookmark URL\n"
  end

  def expected_content
    expect(page).to have_content "facebook hompeage"
  end

