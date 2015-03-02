feature 'Settings' do

  before do
    admin_sign_in
    click_link 'Settings'
  end

  context 'Has options for' do
    scenario 'Generating a mailing list' do
      expect(page).to have_link 'Generate email list'
    end

    scenario 'Inviting a new admin' do
      expect(page).to have_link 'Admin Invitation'
    end

    scenario 'Edit profile' do
      expect(page).to have_link 'Edit admin'
    end
  end

  context 'Inviting a new admin' do
    scenario 'should display the send inviatation page' do
      click_link 'Admin Invitation'
      expect(page).to have_content 'Send invitation'
    end
  end

  context 'Generating a mailing list' do

    scenario 'Admin should be able to see a list of volunteer emails' do
      add_volunteer('Josh', 'Test', 'one@test.com', 'XYZ', 'EC1 2DR', '+447791234567', nil)
      add_volunteer('Test', 'Test', 'two@test.com', 'XYZ', 'EC1 2DR', '+447791234567', nil)

      click_link 'Settings'
      click_link 'Generate email list'
      expect(page).to have_content 'one@test.com'
      expect(page).to have_content 'two@test.com'
    end
  end

  context 'Edit profile' do
    scenario 'Admin should be able to edit his profile' do
      click_link 'Edit admin'
      fill_in 'Email', with: 'test2@example.com'
      fill_in 'Current password', with: 'testtest'
      click_button 'Update'
      expect(page).to have_content 'Your account has been updated successfully'
      expect(current_path). to eq '/'
    end
  end
end
