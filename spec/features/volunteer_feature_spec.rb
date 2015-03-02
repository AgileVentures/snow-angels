feature 'Volunteer' do

  context 'On the homepage' do
    scenario 'Can Register' do
      visit '/'
      expect(page).to have_link 'Register'
    end
  end

  context 'An admin can' do

    before do 
      admin_sign_in
      add_volunteer('Josh', 'Test', 'one@test.com', '123 Fake Street', 'EC1 2DR', '+447791234567', nil)
      click_link 'View volunteer'
    end

    scenario 'View a volunteers details' do
      expect(page).to have_content '123 Fake Street'
      expect(page).to have_content '+447791234567'
      expect(page).to have_content 'Shopping'
    end

    scenario 'Edit a volunteers details' do
      click_link 'Edit'
      fill_in 'Address', with: '3a New Street'
      click_button 'Update Volunteer'
      expect(page).to have_content '3a New Street'
    end

    scenario 'Delete a volunteers details' do
      click_link 'Delete'
      expect(page).not_to have_content 'Josh'
      expect(page).not_to have_content 'Test'
    end
  end

end
