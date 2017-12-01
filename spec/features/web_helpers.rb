def sign_up(username, email, password, confirmation_password)
    visit '/sign_up'
      fill_in 'username', with: username
      fill_in 'signup_email', with: email
      fill_in 'signup_password', with: password
      fill_in 'password_confirmation', with: confirmation_password
      click_button 'sign_up'
end

def sign_in(email, password)
  visit '/'
  # within '#sign_in_form' do
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'sign_in'
  # end
end
