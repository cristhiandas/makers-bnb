feature 'Sign up' do
  scenario 'When opening the page user sees form' do
    visit '/sign_up'
    expect(page).to have_content "Username"
    expect(page).to have_content "Email"
  end

  scenario 'Welcomes the new user' do
    sign_up('fakename', '123@test.com', '12345', '12345')
    expect(page).to have_content('Welcome')
  end

end
