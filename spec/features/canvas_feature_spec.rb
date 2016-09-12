require 'rails_helper'

feature 'Canvas' do
  scenario 'visiting homepage' do
    visit '/'
    expect(page).to have_content('Blank Canvas')
    expect(page).to have_xpath("//img[contains(@src,'room_1.svg')]")
  end

  scenario 'user selects their favourite wireframe' do
    visit '/'
    click_button('first_svg')
    expect(page.current_path).to eq new_canva_path
    expect(page).to have_xpath("//svg[contains(@id, 'svg2')]")
    expect(page).to have_selector("div#1")
    expect(page).not_to have_selector("div#2")
  end

end

feature 'uploading' do
  context 'User uploads a valid picture' do
    scenario 'user photo is displayed' do
      visit "/canvas/new"
      page.attach_file "canva_image", Rails.root + "spec/assets/pic_1.jpg"
      click_button "Upload picture"
      expect(page).to have_xpath("//img[contains(@src,'pic_1.jpg')]")
    end

    scenario 'colour palette is displayed' do
      visit "/canvas/new"
      page.attach_file "canva_image", Rails.root + "spec/assets/black2.jpg"
      click_button "Upload picture"
      expect(page).to have_selector("div.palette")
      expect(page).to have_xpath("//canvas[contains(@style, 'background-color: #000000')]")
    end
  end

  scenario 'user uploads a picture with invalid format' do
    visit "/canvas/new"
    page.attach_file "canva[image]", Rails.root + "spec/assets/ask.rb"
    click_button "Upload picture"
    expect(current_path).to eq new_canva_path
    expect(page).to have_content("Please select a valid picture")
    expect(page).not_to have_selector("div.palette")
  end

  scenario 'user uploads a picture with a transparent background' do
    visit "/canvas/new"
    page.attach_file "canva[image]", Rails.root + "spec/assets/transparent.png"
    click_button "Upload picture"
    expect(current_path).to eq new_canva_path
    expect(page).to have_content("Please select a valid picture")
    expect(page).not_to have_selector("div.palette")
  end

  scenario 'user does not choose any picture' do
    visit "/canvas/new"
    click_button "Upload picture"
    expect(page).to have_content("Please select a valid picture")
  end

  scenario 'user uploads a second photo' do
    visit "/canvas/new"
    page.attach_file "canva[image]", Rails.root + "spec/assets/pic_1.jpg"
    click_button "Upload picture"
    page.attach_file "canva[image]", Rails.root + "spec/assets/pic_2.jpg"
    click_button "Upload picture"
    expect(page).to have_xpath("//img[contains(@src,'pic_2.jpg')]")
  end

  scenario 'user gets the error message when uploads whilst not selecting a picture' do
    visit "/canvas/new"
    page.attach_file "canva[image]", Rails.root + "spec/assets/pic_1.jpg"
    click_button "Upload picture"
    click_button "Upload picture"
    expect(page).to have_content("Please select a valid picture")
  end

end
