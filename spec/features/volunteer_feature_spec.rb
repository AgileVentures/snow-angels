feature 'volunteer' do

  context 'volunteer is on the homepage' do
    scenario ' should display a prompt to register' do
      visit '/'
      expect(page).to have_link 'Register'
    end
  end

  context 'a volunteer personal details to be shown in the listing' do
    scenario 'a volunteer can be shown in a list page' do
      visit '/'
      click_link 'Register'
      fill_in 'Name', with: 'Richard'
      fill_in 'Last name', with: 'Smith'
      fill_in 'Address', with: 'Address123'
      fill_in 'Post code', with: 'E1 6TD'
      fill_in 'Mobile number', with: '12345678910'
      check 'Shopping'
      click_button 'Create Volunteer'
      expect(page).to have_content 'Richard'
      expect(page).to have_content 'Address123'
      expect(page).to have_content '12345678910'
      expect(page).to have_content 'Shopping'
    end
  end

  context "a volunteer's personal details can be edited" do
    scenario 'a volunteers details can be edited in the show page' do
      visit '/'
      click_link 'Register'
      fill_in 'Name', with: 'Richard'
      fill_in 'Last name', with: 'Smith'
      fill_in 'Address', with: 'Address123'
      fill_in 'Post code', with: 'E1 6TD'
      fill_in 'Mobile number', with: '12345678910'
      click_button 'Create Volunteer'
      click_link 'Edit1'

      fill_in 'Name', with: 'Richard_2'
      fill_in 'Last name', with: 'Smith_2'
      fill_in 'Address', with: 'Address123_2'
      fill_in 'Post code', with: 'E1 6TD_2'
      fill_in 'Mobile number', with: '12345678910'
      click_button 'Update Volunteer'
      expect(page).to have_content 'Richard_2'
      expect(page).to have_content 'Address123_2'
      expect(page).to have_content '12345678910'
    end
  end

  context "a volunteer's personal details can be deleted" do
    scenario 'a volunteers details can be deleted in the show page' do
      visit '/'
      click_link 'Register'
      fill_in 'Name', with: 'Richard'
      fill_in 'Last name', with: 'Smith'
      fill_in 'Address', with: 'Address123'
      fill_in 'Post code', with: 'E1 6TD'
      fill_in 'Mobile number', with: '12345678910'
      click_button 'Create Volunteer'
      click_link 'Delete'

      expect(page).not_to have_content 'Richard'
      expect(page).not_to have_content 'Smith'
      expect(page).not_to have_content 'Address123'
      expect(page).not_to have_content 'E1 6TD'
      expect(page).not_to have_content '12345678910'
    end
  end
end
