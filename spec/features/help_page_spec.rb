require 'rails_helper'

feature 'Help page' do
  scenario 'Link to help available on all pages' do
    visit '/'
    click_link 'help'
    expect(page).to have_content'How to use the site'
  end
end
