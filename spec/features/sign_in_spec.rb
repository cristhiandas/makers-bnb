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


end
