require 'rails_helper'

feature 'Canvas' do
  scenario 'visiting homepage' do
    visit '/'
    expect(page).to have_content('Blank Canvas')
    expect(page).to have_xpath("//img[contains(@src,'test.svg')]")
  end

  scenario 'user selects their favourite wireframe' do
    visit '/'
    click_button('first_svg')
    expect(page.current_path).to eq new_canva_path
    expect(page).to have_selector("div#1")
    expect(page).not_to have_selector("div#2")
  end

end

feature 'uploading' do
  scenario 'user uploads the picture' do
    visit "/canvas/new"
    page.attach_file "canva[image]", Rails.root + "spec/assets/pic_1.jpg"
    click_button "Upload picture"
    # cdiv = page.find(:css, "#canvas_1")
    # whatever = execute_script("window.getComputedStyle(document.getElementById('canvas_2').style.backgroundColor")
    # expect(whatever).to eq("rgb(165, 99, 95)")
    expect(page).to have_selector("div#first")
  end

  scenario 'user uploads the picture with incorrect format' do
    visit "/canvas/new"
    page.attach_file "canva[image]", Rails.root + "spec/assets/ask.rb"
    click_button "Upload picture"
    expect(current_path).to eq new_canva_path
    expect(page).to have_content("Please select a valid picture")
  end

  scenario 'user does not choose any picture' do
    visit "/canvas/new"
    click_button "Upload picture"
    expect(page).to have_content("Please select a valid picture")
  end

end
