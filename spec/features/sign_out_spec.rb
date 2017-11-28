feature 'sign out' do

  scenario '' do
    sign_up('fakename', '123@test.com', '12345', '12345')
    click_button 'Sign out'
    expect(page).to have_content('This is Makers bnb')
    expect(page).not_to have_content('welcome fakename')
  end
end
