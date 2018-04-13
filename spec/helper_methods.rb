
  def database_setup
    PG.connect :dbname => 'bookmark_manager_test', :user => 'danielwork'
  end

  def add_test_urls
    database_setup.exec_params("INSERT INTO bookmarks (url, urlname) VALUES ($1, $2)", ['http://facebook.com', 'facebook homepage'])
  end

  def url_content
    expect(page).to have_content "Enter Bookmark URL\n"
  end

  def expected_content
    expect(page).to have_content "facebook hompeage"
  end

