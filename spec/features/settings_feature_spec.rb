feature 'setting' do

  context 'settings link is on the dashboard page' do
    scenario ' should display a link called settings' do
      visit '/'
      admin_sign_in
      expect(page).to have_link 'Settings'
    end
    scenario 'should display a link called Generate email list' do
      visit '/'
      admin_sign_in
      click_link 'Settings'
      expect(page).to have_link 'Generate email list'
    end

    scenario 'should display a link called Admin Invitation' do
      visit '/'
      admin_sign_in
      click_link 'Settings'
      expect(page).to have_link 'Admin Invitation'
    end

    scenario 'should display the send inviatation page' do
      visit '/'
      admin_sign_in
      click_link 'Settings'
      click_link 'Admin Invitation'
      expect(page).to have_content 'Send invitation'
    end
  end
end
