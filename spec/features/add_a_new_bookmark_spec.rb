feature 'check url' do
  scenario 'the bookmark must be a valid url' do
    visit('/')
    fill_in :add_url, with: "htttp://ww.bbc.co.uk"
    fill_in :title, with: "bbc"
    click_button 'submit'
    expect(page).not_to have_content "htttp://ww.bbc.co.uk"
    expect(page).to have_content("invalid url")
  end
end
