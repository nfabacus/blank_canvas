def pick_svg
  visit '/'
  click_button('first_svg')
end

def create_a_coloured_canvas
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
end
