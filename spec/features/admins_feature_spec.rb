feature 'admins' do
  context "admin not signed in and on the homepage" do
    scenario "should see a 'sign in' link" do
      visit '/'
      expect(page).to have_link 'Sign in'
    end

    scenario "should not see 'sign up' or 'sign out' link" do
      visit '/'
      expect(page).not_to have_link 'Sign up'
      expect(page).not_to have_link 'Sign out'
    end
  end

  context "admin signed in on the homepage" do

    before do
      admin = Admin.new(email: 'test@example.com', password: 'testtest', password_confirmation: 'testtest')
      admin.save
      visit '/'
      click_link 'Sign in'
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'testtest'
      click_button 'Log in'
    end

    scenario "should see 'sign out' link" do
      visit '/pages'
      expect(page).to have_link 'Sign out'
    end

    scenario "should not see a 'sign in'" do
      visit '/'
      expect(page).not_to have_link 'Sign in'
    end

  end

  context 'Sending a mass email' do

    before do
      admin = Admin.new(email: 'test@example.com', password: 'testtest', password_confirmation: 'testtest')
      admin.save
      visit '/'
      click_link 'Sign in'
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'testtest'
      click_button 'Log in'
    end

    scenario 'Admin should be able to see a list of volunteer emails' do
      Volunteer.create(name: 'Josh', last_name: 'Test', email: 'one@test.com', post_code: 'EC1 2DR', mobile_number: '+447791234567', address: 'XYZ', availability: nil)
      Volunteer.create(name: 'Test', last_name: 'Test', email: 'two@test.com', post_code: 'EC1 2DR', mobile_number: '+447791234567', address: 'XYZ', availability: nil)

      click_link 'Settings'
      click_link 'Generate email list'
      expect(page).to have_content 'one@test.com'
      expect(page).to have_content 'two@test.com'
    end

  end
end