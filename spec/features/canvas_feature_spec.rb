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

  it 'a user can endorse a count', js: true do
    visit '/'
    click_button('first_svg')
    expect(page).to have_content("1 endorsement")
  end

  scenario 'user uploads the picture' do
    visit "/canvas/new"
    page.attach_file "canva[image]", Rails.root + "spec/assets/pic_1.jpg"
    click_button "Upload picture"
    cdiv = page.find(:css, "#canvas_1")
    p cdiv
    # response.body.should have_xpath("//#canvas_1[@background-color => '#343434 ']")
    expect(page).to have_css("canvas_2", backgroundColor: "#82751f")
  end
end
