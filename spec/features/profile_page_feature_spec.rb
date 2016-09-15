require 'rails_helper'

feature 'Profile page' do

  scenario 'A logged in user sees a button to save their canvas' do
    visit '/'
    click_link 'sign up'
    fill_in 'user[user_name]', with: 'test_user'
    fill_in 'user[email]', with: 'test@test.co.uk'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    click_button 'Sign up'
    click_button('first_svg')
    page.attach_file "canva[image]", Rails.root + "spec/assets/black2.jpg"
    click_button "Show my Colours"
    click_button "Continue"
    page.find('#generate_svg').click
    expect(page).to have_content 'My collection'
  end

  scenario 'A logged in user has a profile page' do
    visit '/'
    click_link 'sign up'
    fill_in 'user[user_name]', with: 'test_user'
    fill_in 'user[email]', with: 'test@test.co.uk'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    click_button 'Sign up'
    click_button('first_svg')
    page.attach_file "canva[image]", Rails.root + "spec/assets/black2.jpg"
    click_button "Show my Colours"
    click_button 'Continue'
    click_button 'Save'
    expect(page).to have_content 'My collection'
    # expect(page).to have_xpath("//img[contains(@src,'pic_1.jpg')]")
  end



end
