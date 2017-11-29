feature 'sign in' do

  scenario 'user can sign in' do
    sign_up('fakename', '123@test.com', '12345', '12345')
    sign_in('123@test.com', '12345')
    expect(page).to have_content('Welcome fakename')
  end

  scenario 'user cannot sign in with wrong password' do
    sign_up('fakename', '123@test.com', '12345', '12345')
    sign_in('123@test.com', '22345')
    expect(page).to_not have_content('Welcome fakename')
  end

  scenario 'it has a sign up button' do
    visit '/'
    expect(page).to have_button('go_sign_up')
  end

  scenario 'goes to sign up page' do
    visit '/'
    click_button('go_sign_up')
    expect(page).to have_content('Please Sign Up')
  end


end
