require 'sinatra/base'
require 'pg'
require 'pry'

require_relative 'bookmarks'
require_relative 'helper_methods'

class App < Sinatra::Base

  get '/' do
    test_database
    setup
    erb :index
    #binding.pry
  end


  run if $app_file == 0

end
