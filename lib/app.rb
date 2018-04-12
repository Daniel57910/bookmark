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

  post '/add_url' do
    p params
    @url = URI(params[:url])
    @name = params[:urlname]

    if @url.scheme == nil or @url.host == nil
      flash[:incorrect_bookmark] = "URL is not correct. Please enter a correct URL."
      redirect '/add'
    else
      Bookmarks.add(Bmark.new(@url, @name))
      redirect '/'
    end

  end

  run if $app_file == 0

end
