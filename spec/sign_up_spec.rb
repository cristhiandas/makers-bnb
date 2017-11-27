require 'capybara/rspec'
feature 'Sign up' do
  scenario 'When opening the page user sees form' do
    visit '/sign_up'
    expect(page).to have_content "Username"
    expect(page).to have_content "Email"
  end
end
