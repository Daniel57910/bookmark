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
