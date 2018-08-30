feature 'adding a new bookmark' do
  scenario 'a user can add a bookmark' do
    visit('/')
    fill_in('add_url', with: 'http://testbookmark.com')
    click_button('submit')
    expect(page).to have_content 'http://testbookmark.com'
  end
end
