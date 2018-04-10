require 'sinatra/base'
require 'pg'
require 'pry'

require_relative 'bookmarks'

class App < Sinatra::Base

  get '/' do
    @bookmarks = Bookmarks.new
    erb :index
  end


  run if $app_file == 0

end
