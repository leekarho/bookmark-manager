require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      Bookmark.create('http://www.google.com', 'google')
      Bookmark.create('http://www.destroyallsoftware.com', 'destroy')

      bookmarks = Bookmark.all
      bookmark = Bookmark.all.first

      expect(bookmarks.length).to eq 2
      expect(bookmark).to respond_to(:title)
      expect(bookmark.url).to eq("http://www.google.com")
      expect(bookmark.title).to eq("google")
    end
  end

  describe '.create' do
    it 'does not create a new bookmark if the url is not valid' do
      Bookmark.create('htttttp//www.bbc.co.uk')
      expect(Bookmark.all).not_to include 'htttttp//www.bbc.co.uk'
    end
    it 'creates a new bookmark' do
      bookmark = Bookmark.create('http://www.testbookmark.com', 'Test bookmark')
      bookmark = Bookmark.all.map { |bookmark| bookmark.title }
      expect(bookmark).to include 'Test bookmark'
    end
  end
end
