require 'rails_helper'

feature 'Canvas' do
  scenario 'visiting homepage' do
    visit '/'
    expect(page).to have_content('Blank Canvas')
  end

end
