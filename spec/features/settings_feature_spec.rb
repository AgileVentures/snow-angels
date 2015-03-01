feature 'Settings' do

  before { admin_sign_in }

  context 'settings link is on the dashboard page' do

    scenario ' should display a link called settings' do
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

  context 'Sending a mass email' do

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
