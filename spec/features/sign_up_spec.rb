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


end
