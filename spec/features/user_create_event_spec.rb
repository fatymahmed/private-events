# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user creates event', type: :feature do
  scenario 'successfully with valid information' do
    visit new_event_path
    expect(page).to have_current_path(new_user_path)
    fill_in('Name', with: 'Example')
    fill_in('Email', with: 'example@email.com')
    click_button('Submit')
    expect(page).to have_current_path(signin_path)
    fill_in('Email', with: 'example@email.com')
    click_button('Submit')
    visit new_event_path
    fill_in('Description', with: 'an event')
    fill_in('Date', with: Date.today)
    fill_in('Location', with: 'microverse')
    click_button('Submit')
    expect(page).to have_css('.event')
  end
end
