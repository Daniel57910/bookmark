require 'app'

feature 'Loading a page of bookmarks' do
  scenario 'Loading homepage presents user with a list of bookmarks' do
    visit '/'
    expect(page).to have_content "www.makersacademy.com 1"
    expect(page).to have_content "www.askjeeves.com 3"
    expect(page).to have_content "www.destroyallsoftware.com 2"
    expect(page).to have_content "www.google.com 4"
    expect(page).to have_content "www.facebook.com 5"
    expect(page).to have_content "www.nike.com 6"
  end
end
