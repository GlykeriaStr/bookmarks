feature 'update a bookmark' do
  scenario 'user can change details on a bookmark' do
    bookmark = Bookmark.create(title: 'msn', url: 'http://www.msn.com')
    visit('/bookmarks')
    expect(page).to have_link('msn', href: 'http://www.msn.com')

    click_button 'Edit'
    expect(page).to have_content 'Edit your bookmark:'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"


    fill_in('url', with: 'http://www.bbc.co.uk')
    fill_in('title', with: 'BBC')
    click_button 'Save'
    expect(page).not_to have_link('msn', href: 'http://www.msn.com')
    expect(page).to have_link('BBC', href: 'http://www.bbc.co.uk')
  end
end
