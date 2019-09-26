# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user signup', type: :feature do
  scenario 'signs up the user correctly' do
    visit new_user_path
    fill_in('Name', with: 'Example')
    fill_in('Email', with: 'example@email.com')
    click_button('Submit')
    visit signin_path
    fill_in('Email', with: 'example@email.com')
    click_button('Submit')
    expect(page).to have_css('.user')
    expect(page).to have_content('Example')
  end
end
