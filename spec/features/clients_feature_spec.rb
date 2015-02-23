require 'rails_helper'

feature "client" do
  
  context "Add client" do

    before do
      admin = Admin.new(email: 'test@example.com', password: 'testtest', password_confirmation: 'testtest')
      admin.save
      visit '/'
      click_link 'Sign in'
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'testtest'
      click_button 'Log in'
    end

    it "should be able display a form to add a client" do
      visit '/pages'
      click_link 'Add client'
      expect(page).to have_content 'Name'
      expect(page).to have_content 'Last name'
      expect(page).to have_content 'Address'
      expect(page).to have_content 'Postcode'
      expect(page).to have_content 'Phone'
    end

    it "should be able to create a client" do
      visit '/pages'
      click_link 'Add client'
      fill_in 'Name', with: 'Tom'
      fill_in 'Last name', with: 'Smith'
      fill_in 'Address', with: 'Makers'
      fill_in 'Postcode', with: 'E1 2SF'
      fill_in 'Phone', with: '07450991234'
      click_button 'Create Client'
      expect(page).to have_content 'Client successfully added'
      expect(current_path).to eq '/pages'
    end

  end

end