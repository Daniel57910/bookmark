require 'app'
require 'helper_methods'
require 'pg'

feature 'Loading a page of bookmarks' do
  scenario 'Loading homepage presents user with a list of bookmarks' do
    add_test_urls
    visit ('/')
    url_content
  end
end

feature 'creating a new bookmark' do
  scenario 'adding a url to create a new bookmark' do
    visit '/'
    click_button('Add Bookmark')
    fill_in('url', with: "http://nike.com")
    fill_in('urlname', with: "nike homepage")
    click_button('Submit')
    url_content
    expect(page).to have_content "nike homepage"
  end
end

feature 'adding an incorrect bookmark' do
  scenario 'adding an incorrect bookmark reroutes you to the add page' do
    add_test_urls
    visit ('/')
    click_button('Add Bookmark')
    fill_in('url', with: "wwwvwonke.com")
    click_button('Submit')
    expect(page).to have_content "URL is not correct. Please enter a correct URL"
  end
end

feature 'deleting a bookmark from the bookmark bar' do
  scenario "user deletes a bookmark and receives confirmation that it's gone" do
    Capybara.ignore_hidden_elements = false
    add_test_urls
    visit ('/')
    save_and_open_page
    click_button("Delete")
    expect(page).to have_content 'your page was successfully deleted!'
  end
end

feature 'updating a bookmark from the bookmarks bar' do
  scenario "user updates either the page name or url" do
    add_test_urls
    visit('/')
    save_and_open_page
    click_button("Update")
    expect(page).to have_content "your bookmark was successfully updated"
  end
end

