def pick_svg
  visit '/'
  click_button('first_svg')
end

def create_a_coloured_canvas
  visit '/'
  click_link 'sign up'
  # fill_in 'Username', with: 'test'
  fill_in 'Email', with: 'test@test.co.uk'
  fill_in 'Password', with: '123456'
  fill_in 'Password confirmation', with: '123456'
  click_button 'Sign up'
  click_button('first_svg')
  page.attach_file "canva_image", Rails.root + "spec/assets/black2.jpg"
  click_button "Show my colours"
end
