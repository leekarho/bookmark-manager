feature 'viewing bookmarks' do

  scenario 'a user can see a list of saved bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content 'www.google.com'
    expect(page).to have_content 'www.bbc.co.uk'
  end
end
