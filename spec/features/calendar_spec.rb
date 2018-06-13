require 'rails_helper'

feature 'calendar' do
  scenario 'welcome message' do
    visit('/')
    expect(page).to have_content('Lunches')
  end
end