require 'app'

feature 'Loading a page of bookmarks' do
  scenario 'Loading homepage presents user with a list of bookmarks' do
    visit '/'
    expect(page).to have_content "www.google.com 1"
    expect(page).to have_content "www.destroyallsoftware.com 2"
    expect(page).to have_content "www.askjeeves.com 3"
  end
end
