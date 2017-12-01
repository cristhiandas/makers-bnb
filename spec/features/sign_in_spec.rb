feature 'sign in' do

  scenario 'user can sign in' do
    sign_up('fakename', '123@test.com', '12345', '12345')
    click_button('Sign out')
    sign_in('123@test.com', '12345')
    expect(page).to have_content('Venues')
  end

  scenario 'user cannot sign in with wrong password' do
    sign_up('fakename', '123@test.com', '12345', '12345')
    click_button('Sign out')
    sign_in('123@test.com', '22345')
    expect(page).to have_content('This is Makers bnb')
  end

  scenario 'it has a sign up button' do
    visit '/'
    expect(page).to have_link('Sign up')
  end

  scenario 'goes to sign up page' do
    visit '/'
    click_link('Sign up')
    expect(page).to have_content('Please Sign Up')
  end


end
