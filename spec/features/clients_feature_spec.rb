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
      visit '/'
      click_link 'Add client'
      expect(page).to have_content 'Name'
      expect(page).to have_content 'Last name'
      expect(page).to have_content 'Address'
      expect(page).to have_content 'Postcode'
      expect(page).to have_content 'Phone'
    end

    it "should be able to create a client" do
      visit '/'
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

  context 'view client' do

    before do
      admin = Admin.new(email: 'test@example.com', password: 'testtest', password_confirmation: 'testtest')
      admin.save
      visit '/'
      click_link 'Sign in'
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'testtest'
      click_button 'Log in'
      add_client
    end

    it "admin should be able to see client details" do
      visit '/'
      click_link 'View client'
      expect(page).to have_content 'Tom'
      expect(current_path).to eq '/clients'
    end

    it "should be able to search" do
      add_second_client
      visit '/'
      click_link 'View client'
      fill_in 'search', with: 'Tom'
      click_button 'Search'
      expect(page).to have_content('Tom')
      expect(page).not_to have_content('Bob')
    end

  end

end