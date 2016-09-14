require 'rails_helper'

feature 'Canvas' do

  context 'Using the site as a guest' do

    scenario 'visiting homepage' do
      visit '/'
      expect(page).to have_content('select a room to style')
      expect(page).to have_xpath("//img[contains(@src,'room_1.svg')]")
    end

    scenario 'user selects their favourite wireframe' do
      pick_svg
      expect(page.current_path).to eq new_canva_path
      page.attach_file "canva_image", Rails.root + "spec/assets/pic_1.jpg"
      click_button "Show my colours"
      click_button "Continue"
      expect(page).to have_xpath("//svg[contains(@id, 'svg2')]")
    end

    scenario 'user provides colour source' do
      pick_svg
      page.attach_file "canva_image", Rails.root + "spec/assets/pic_1.jpg"
      click_button "Show my colours"
      expect(page).to have_xpath("//img[contains(@src,'pic_1.jpg')]")
    end

      scenario 'colour palette is displayed' do
        pick_svg
        page.attach_file "canva_image", Rails.root + "spec/assets/black2.jpg"
        click_button "Show my colours"
        expect(page).to have_xpath("//canvas[contains(@style, 'background-color: #000000')]")
      end


    scenario 'user uploads a picture with invalid format' do
      pick_svg
      page.attach_file "canva[image]", Rails.root + "spec/assets/ask.rb"
      click_button "Show my colours"
      expect(current_path).to eq new_canva_path
      expect(page).to have_content("Please select a valid picture")
      expect(page).not_to have_selector("div.palette")
    end

    scenario 'user uploads a picture with a transparent background' do
      pick_svg
      page.attach_file "canva[image]", Rails.root + "spec/assets/transparent.png"
      click_button "Show my colours"
      expect(current_path).to eq new_canva_path
      expect(page).to have_content("Please select a valid picture")
      expect(page).not_to have_selector("div.palette")
    end

    scenario 'user does not choose any picture' do
      pick_svg
      click_button "Show my colours"
      expect(page).to have_content("Please select a valid picture")
    end

    scenario 'user can upload a different photo' do
      pick_svg
      page.attach_file "canva[image]", Rails.root + "spec/assets/pic_1.jpg"
      click_button "Show my colours"
      click_button "Try again"
      page.attach_file "canva[image]", Rails.root + "spec/assets/pic_2.jpg"
      click_button "Show my colours"
      expect(page).to have_xpath("//img[contains(@src,'pic_2.jpg')]")
    end

    scenario 'user does not have the option to save their canvas' do
      pick_svg
      page.attach_file "canva_image", Rails.root + "spec/assets/black2.jpg"
      click_button "Show my colours"
      click_button "Continue"
      expect(page).not_to have_link 'Save'
      expect(page).to have_button 'New Room'
    end
  end

end
