require 'sinatra/base'
require 'pg'
require_relative 'bookmarks'

class App < Sinatra::Base

  get '/' do
    @urls = PG.connect :dbname => 'bookmarks', :user => 'danielwork'
    @url = @urls.exec "SELECT * FROM bookmarks"
    erb :index
  end


  run if $app_file == 0

end
