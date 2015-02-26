feature 'volunteer' do

  context 'volunteer is on the homepage' do
    scenario ' should display a prompt to register' do
      visit '/volunteers'
      expect(page).to have_content 'Welcome to Snow Angels'
      expect(page).to have_link 'Register'
    end
  end

  context 'a volunteer has registered' do
    scenario 'user fills out a form, then displays the new volunteer profile' do
      visit '/volunteers'
      click_link 'Register'
      fill_in 'First Name', with: 'Richard'
      fill_in 'Last Name', with: 'Smith'
      fill_in 'Address', with: 'Address123'
      fill_in 'Post code', with: 'E1 6TD'
      fill_in 'Mobile number', with: '123456'
      click_button 'Create Volunteer'
    end
  end

  context 'a volunteer personal details to be shown in the listing' do
    scenario 'a volunteer can be shown in a list page' do
      visit '/volunteers'
      click_link 'Register'
      fill_in 'First Name', with: 'Richard'
      fill_in 'Last Name', with: 'Smith'
      fill_in 'Address', with: 'Address123'
      fill_in 'Post code', with: 'E1 6TD'
      fill_in 'Mobile number', with: '123456'
      click_button 'Create Volunteer'
      expect(page).to have_content 'Richard'
      expect(page).to have_content 'Address123'
      expect(page).to have_content '123456'
    end
  end

  context "a volunteer's personal details can be edited" do
    scenario 'a volunteers details can be edited in the show page' do
      visit '/volunteers'
      click_link 'Register'
      fill_in 'First Name', with: 'Richard'
      fill_in 'Last Name', with: 'Smith'
      fill_in 'Address', with: 'Address123'
      fill_in 'Post code', with: 'E1 6TD'
      fill_in 'Mobile number', with: '123456'
      click_button 'Create Volunteer'
      click_link 'Edit1'

      fill_in 'First Name', with: 'Richard_2'
      fill_in 'Last Name', with: 'Smith_2'
      fill_in 'Address', with: 'Address123_2'
      fill_in 'Post code', with: 'E1 6TD_2'
      fill_in 'Mobile number', with: '123456_2'
      click_button 'Update Volunteer'
      expect(page).to have_content 'Richard_2'
      expect(page).to have_content 'Address123_2'
      expect(page).to have_content '123456_2'
    end
  end

  context "a volunteer's personal details can be deleted" do
    scenario 'a volunteers details can be deleted in the show page' do
      visit '/volunteers'
      click_link 'Register'
      fill_in 'First Name', with: 'Richard'
      fill_in 'Last Name', with: 'Smith'
      fill_in 'Address', with: 'Address123'
      fill_in 'Post code', with: 'E1 6TD'
      fill_in 'Mobile number', with: '123456'
      click_button 'Create Volunteer'
      click_link 'Delete'

      expect(page).not_to have_content 'Richard'
      expect(page).not_to have_content 'Smith'
      expect(page).not_to have_content 'Address123'
      expect(page).not_to have_content 'E1 6TD'
      expect(page).not_to have_content '123456'
    end
  end


end
