require 'rails_helper'

feature 'sign up user' do
  scenario 'signs up with valid data' do
    visit('/')
    click_on('Sign up')
    expect(page).to have_content('Lunches')
    fill_in('Email', with: 'admin@admin.admin')
    fill_in('Password', with: 'qwerty')
    fill_in('Password confirmation', with: 'qwerty')
    click_on('Sign up')

    expect(page).to have_content('You have signed up successfully')
    expect(User.last.email).to  eq('admin@admin.admin')
  end

  scenario 'cannot sign up with invalid data' do
    visit('/')
    click_on('Sign up')
    expect(page).to have_content('Lunches')
    click_on('Sign up')

    expect(page).to have_content('can\'t be blank')
  end

  scenario 'first signed up user is admin' do
    visit('/')
    click_on('Sign up')
    expect(page).to have_content('Lunches')
    fill_in('Email', with: 'admin@admin.admin')
    fill_in('Password', with: 'qwerty')
    fill_in('Password confirmation', with: 'qwerty')
    click_on('Sign up')

    expect(page).to have_content('You have signed up successfully')
    expect(User.first.email).to  eq('admin@admin.admin')
    expect(User.first.admin).to  eq(true)
  end
end