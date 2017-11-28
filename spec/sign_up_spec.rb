require 'capybara/rspec'

feature 'Sign up' do
  scenario 'When opening the page user sees form' do
    visit '/sign_up'
    expect(page).to have_content "Username"
    expect(page).to have_content "Email"
  end

  scenario 'Welcomes the new user' do
    visit '/sign_up'
    fill_in ('username'), with: 'Cristhian'
    fill_in ('email'), with: 'fakeemail@gmail.com'
    fill_in ('password'), with: 'password'
    click_button('sign_up')

    expect(page).to have_content('Welcome')
  end
end
