require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/add_bookmark' do
    url = params[:add_url]
    Bookmark.create(url)
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
