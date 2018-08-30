require 'sinatra/base'
require './lib/bookmark'
require 'sinatra/flash'
require 'uri'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/add_bookmark' do
    url = params[:add_url]
    flash[:notice] = "invalid url" unless Bookmark.create(url)
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
