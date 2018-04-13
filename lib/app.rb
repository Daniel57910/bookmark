require 'sinatra/base'
require 'sinatra/flash'
require 'pg'
require 'pry'
require_relative 'bookmarks'

class App < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  Bookmarks.connect

  get '/' do
    
    @pages = Bookmarks.show_bookmarks
    #p @pages
    erb :index
  end

  get '/add' do
    erb :add
  end

  post '/add_url' do
    p params
    url = URI(params[:url])
    name = params[:urlname]
    if url.scheme == nil or url.host == nil
      flash[:incorrect_bookmark] = "URL is not correct. Please enter a correct URL."
      redirect '/add'
    else
      Bookmarks.add(Bmark.new(url, name))
      redirect '/'
    end
  end

  post '/delete' do
    flash[:deleted_page] = "your page was successfully deleted!"
    delete =  params[:delete_bmark]
    Bookmarks.delete(delete)
    redirect '/'
    
  end

  

  run if $app_file == 0

end
