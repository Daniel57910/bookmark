
RSpec.configure do | config |
  ENV['RACK_ENV'] = 'test'
  require 'capybara/rspec'
  require 'capybara'
  require 'rspec'
  require 'simplecov'
  require 'simplecov-console'
  require 'app'
  Capybara.app = App

end

SimpleCov.start

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])



