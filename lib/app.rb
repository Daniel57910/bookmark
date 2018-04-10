require 'sinatra/base'
require 'pg'
require 'pry'
require_relative 'bmark'

require_relative 'bookmarks'

class App < Sinatra::Base

  get '/' do
    @bookmarks = Bookmarks.new
    erb :index
  end

  get '/add' do
    erb :add
    #redirect '/success'
  end

  post '/success' do
    p params
    bmark = Bmark.new(params[:url])
    Bookmarks.new.add(bmark)
    redirect '/'
  end


  run if $app_file == 0

end
