require 'app'
require 'helper_methods'

feature 'Loading a page of bookmarks' do
  scenario 'Loading homepage presents user with a list of bookmarks' do
    database_setup
    visit '/'
    expect(page).to have_content "www.facebook.com"
    expect(page).to have_content "www.google.com"
    expect(page).to have_content "www.yahoo.com"
  end
end

feature 'creating a new bookmark' do
  scenario 'adding a url to create a new bookmark' do
    database_setup
    visit '/'
    click_button('Add Bookmark')
    fill_in('url', with: "www.test.com")
    click_button('Submit')
    expect(page).to have_content "Congrats You Have Added A New Bookmark"
  end
end
