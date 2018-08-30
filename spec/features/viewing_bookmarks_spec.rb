require 'pg'

feature 'viewing bookmarks' do

  scenario 'a user can see a list of saved bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'makers');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com', 'destroyer');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com', 'google');")

    visit('/bookmarks')

    expect(page).to have_content "makers"
    expect(page).to have_content "destroyer"
    expect(page).to have_content "google"
  end
end
