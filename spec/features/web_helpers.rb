def sign_up(username, email, password, confirmation_password)
    visit '/sign_up'
    within('#form_sign_up') do
      fill_in 'username', with: username
      fill_in 'email', with: email
      fill_in 'password', with: password
      fill_in 'confirm_password', with: confirmation_password
      click_button 'sign_up'
    end
end
