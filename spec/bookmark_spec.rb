require "bookmark"
require 'database_helpers'


describe Bookmark do

  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(title: 'Twitter', url: 'http://www.twitter.com')
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Twitter'
      expect(bookmarks.first.url).to eq "http://www.twitter.com"
    end
  end

  describe '.create' do
    it 'adds a new bookmark to the database' do
      bookmark = Bookmark.create(title: 'Twitter', url: 'http://www.twitter.com')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq('Twitter')
      expect(bookmark.url).to eq('http://www.twitter.com')
    end
  end

  describe '.delete' do
    it 'deletes a selected bookmark' do
      bookmark = Bookmark.create(title: 'Twitter', url: 'http://www.twitter.com')
      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.count).to eq 0
    end
  end

  describe '.edit' do
    it 'edits a selected bookmark' do
      bookmark = Bookmark.create(title: 'Twitter', url: 'http://www.twitter.com')
      edited_bookmark = Bookmark.edit(id: bookmark.id, url: 'http://www.bbc.co.uk', title: 'BBC')
      expect(edited_bookmark.title).to eq 'BBC'
      expect(edited_bookmark.url).to eq 'http://www.bbc.co.uk'
      expect(edited_bookmark).to be_a Bookmark
      expect(edited_bookmark.id).to eq bookmark.id
    end
  end
end
