require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'google');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.destroyallsoftware.com', 'destroy');")

      bookmarks = Bookmark.all.map { |bookmark| bookmark.url }

      expect(bookmarks).to include(("http://www.google.com"))
      expect(bookmarks).to include(("http://www.destroyallsoftware.com"))
    end
  end

  describe '.create' do
    it 'does not create a new bookmark if the url is not valid' do
      Bookmark.create('htttttp//www.bbc.co.uk')
      expect(Bookmark.all).not_to include 'htttttp//www.bbc.co.uk'
    end
  end
end
