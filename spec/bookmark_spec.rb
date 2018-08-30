require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")

      bookmarks = Bookmark.all

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
