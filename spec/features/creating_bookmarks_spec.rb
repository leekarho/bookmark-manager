feature 'adding a new bookmark' do
  scenario 'a user can add a bookmark' do
    visit('/')
    fill_in('add_url', with: 'http://testbookmark.com')
    fill_in :title, with: 'test'
    click_button('submit')
    expect(page).to have_content 'test'
  end
end
