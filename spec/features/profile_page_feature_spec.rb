require 'rails_helper'

feature 'Canva' do
  scenario 'An unregistered user does not have the option to save their canvas' do
    visit "/"
    click_button('first_svg')
    page.attach_file "canva_image", Rails.root + "spec/assets/black2.jpg"
    click_button "Upload picture"
    expect(page).to have_selector("div.palette")
    expect(page).to have_xpath("//canvas[contains(@style, 'background-color: #000000')]")
    expect(page).not_to have_link 'Save my canvas'

  end

  scenario 'A logged in user sees a button to save their canvas' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'test@test.co.uk'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    click_button('first_svg')
    page.attach_file "canva_image", Rails.root + "spec/assets/black2.jpg"
    click_button "Upload picture"
    expect(page).to have_selector("div.palette")
    expect(page).to have_xpath("//canvas[contains(@style, 'background-color: #000000')]")
    expect(page).to have_button 'Save my canvas'
  end

  scenario 'A logged in user has a profile page' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'test@test.co.uk'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    click_button('first_svg')
    page.attach_file "canva_image", Rails.root + "spec/assets/pic_1.jpg"
    click_button "Upload picture"
    click_link 'My profile'
    expect(page).to have_content 'My stuff'
    expect(page).to have_xpath("//img[contains(@src,'pic_1.jpg')]")
  end



end
