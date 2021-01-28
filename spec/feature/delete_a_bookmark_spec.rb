feature 'delete a bookmark' do
  scenario 'A user can delete a bookmark' do
    Bookmark.create(url: "http://www.msn.com", title: "msn")
    visit('/bookmarks')
    expect(page).to have_link("msn", href: "http://www.msn.com")

    click_button "Delete"
    expect(page).not_to have_link("msn", href: "http://www.msn.com")
  end
end
