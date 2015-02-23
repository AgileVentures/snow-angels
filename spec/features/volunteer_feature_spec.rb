require 'rails_helper'

feature 'volunteer' do

  context 'volunteer is on the homepage' do
    scenario ' should display a prompt to register' do
      visit '/volunteers'
      expect(page).to have_content 'Welcome to Snow Angels'
      expect(page).to have_link 'Register'
    end
  end

  context 'a volunteer has registered' do
    scenario 'user fills out a form, then displays the new volunteer profile' do
      visit '/volunteers'
      click_link 'Register'
      fill_in 'Name', with: 'Richard'
      click_button 'Create Volunteer'
      # fill_in 'Address' with: 'Address123'
      # fill_in 'Mobile number' with: '123456'
      # check ('A Checkbox')
    end
  end


end
