require 'sinatra/base'
require 'sinatra/flash'
require 'pg'
require 'pry'
require_relative 'bookmarks'

class App < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    Bookmarks.connect
    erb :index
  end

  get '/add' do
    erb :add
    #redirect '/success'
  end

  post '/success' do
    p params
    @url = params[:url]
    @name = params[:urlname]
    @url = URI(@url)
    #binding.pry

    if @url.scheme == nil or @url.host == nil
      flash[:incorrect_bookmark] = "URL is not correct. Please enter a correct URL."
      redirect '/add'
    else
      bmark = Bmark.new(@url, @name)
      Bookmarks.add(bmark)
      #binding.pry
    end

  end


  run if $app_file == 0

end
