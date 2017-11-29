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

  scenario 'wrong password does not enter user' do
    expect{ sign_up('fakename', '123@test.com', '12345', '22345') }.to_not change(User, :count)
  end

  scenario 'sign up creates new user' do
    expect{ sign_up('fakename', '123@test.com', '12345', '12345') }.to change(User, :count)
  end

  scenario 'user cannot sign up with same email' do
    sign_up('fakename', '123@test.com', '12345', '12345')
    expect{ sign_up('fakename', '123@test.com', '12345', '12345') }.to_not change(User, :count)
  end

  scenario 'there is a sign in' do
    visit '/sign_up'
    expect(page).to have_content('Already have an account?')
    expect(page).to have_button('go_sign_in')
  end

  scenario 'user with an account can go to sign in' do
    visit '/sign_up'
    click_button('go_sign_in')
    expect(page).to have_content('This is Makers bnb')
  end
end
