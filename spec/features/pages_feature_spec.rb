feature 'pages' do
  context 'admin has signed in' do
    before do
      admin = Admin.new(email: 'test@example.com', password: 'testtest', password_confirmation: 'testtest')
      admin.save
      visit '/'
      click_link 'Sign in'
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'testtest'
      click_button 'Log in'
    end

    scenario "should display the 'sign up', 'add client', and 'View client' links" do
      visit '/'
      expect(page).to have_link 'Sign up'
      expect(page).to have_link 'Add client'
      expect(page).to have_link 'View client'
      expect(page).to have_link 'Home'
    end

    it 'should be able to return to homepage' do
      visit '/'
      click_link 'View client'
      click_link 'Home'
      expect(current_path).to eq '/pages'
    end

  end

end