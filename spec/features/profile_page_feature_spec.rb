require 'rails_helper'

feature 'Profile page' do

  scenario 'A logged in user sees a button to save their canvas' do
    create_a_coloured_canvas
    expect(page).to have_button 'Save'
  end

  scenario 'A logged in user has a profile page' do
    create_a_coloured_canvas
    click_button 'Save'
    expect(page).to have_content 'My Collection'
    expect(page).to have_xpath("//img[contains(@src,'pic_1.jpg')]")
  end



end
