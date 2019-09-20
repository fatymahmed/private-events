require 'rails_helper'

RSpec.describe 'user signup', type: :feature do
  
  scenario "signs up the user correctly" do
    visit new_user_path
    fill_in('Name', with: 'Example')
    fill_in('Email', with: 'example@email.com')
    click_button('Submit')
    expect(page).to have_css('.user')
    expect(page).to have_content('Example')
  end
  
end



# visit signup page
# fill in email
# fill in name
# click on submit
# check user existence
# check if session/cookie is saved or not
# rediect to user show page
# check redirect
