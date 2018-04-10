
RSpec.configure do | config |
  ENV['RACK_ENV'] = 'test'
  require 'capybara/rspec'
  require 'capybara'
  require 'rspec'
  require 'simplecov'
  require 'simplecov-console'
  require 'app'
  require 'pg'
  Capybara.app = App

  config.before(:each) do
    clear_table
  end
end

SimpleCov.start

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])



def clear_table
  database = PG.connect :dbname => 'bookmark_manager_test', :user => 'danielwork'
  database.exec("TRUNCATE bookmarks;")
end