feature 'pages' do
  context 'admin has signed in' do
    before { admin_sign_in }

    scenario "should display the 'sign up', 'add client', and 'View client' links" do
      visit '/'
      expect(page).to have_link 'Add client'
      expect(page).to have_link 'View client'
      expect(page).to have_link 'Horsell Snow Angels'
    end

    it 'should be able to return to homepage' do
      visit '/'
      click_link 'View client'
      click_link 'Horsell Snow Angels'
      expect(current_path).to eq '/pages'
    end

  end

end