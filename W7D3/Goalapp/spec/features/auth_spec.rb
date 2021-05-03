require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do

  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'New user'
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'username', with: 'Harry Potter'
      fill_in 'password', with: '123456'
      click_button 'Sign up'
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content 'Harry Potter'
    end

  end
end

feature 'logging in' do
  before(:each) do
    user = User.make(username: 'Harry Potter', password: '123456')
    visit user_url(user)
  end
  scenario 'shows username on the homepage after login' do
    expect(page).to have_content 'Harry Potter'
    
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state'
    
  scenario 'doesn\'t show username on the homepage after logout'

end