feature 'volunteer' do

  context 'volunteer is on the homepage' do
    scenario ' should display a prompt to register' do
      visit '/'
      expect(page).to have_link 'Register'
    end
  end

  context 'a volunteer personal details to be shown in the listing' do
    scenario 'a volunteer can be shown in a list page' do
      admin_sign_in
      add_volunteer
      expect(page).to have_content 'Richard'
      expect(page).to have_content 'Address123'
      expect(page).to have_content '12345678910'
      expect(page).to have_content 'Shopping'
    end

    scenario 'multiple preferences can be selected' do
      admin_sign_in
      add_volunteer
      expect(page).to have_content 'Shopping'
      expect(page).to have_content 'Grit spreading'
      expect(page).not_to have_content 'Dog walking'
    end
  end

  context "a volunteer's personal details can be edited" do
    scenario 'a volunteers details can be edited in the show page' do
      admin_sign_in
      add_volunteer
      click_link 'Edit1'
      fill_in 'Name', with: 'Richard_2'
      uncheck 'Shopping'
      click_button 'Update Volunteer'
      expect(page).to have_content 'Richard_2'
      expect(page).to have_content 'false'
    end
  end

  context "a volunteer's personal details can be deleted" do
    scenario 'a volunteers details can be deleted in the show page' do
      admin_sign_in
      add_volunteer
      click_link 'Delete'
      expect(page).not_to have_content 'Richard'
      expect(page).not_to have_content 'Smith'
    end
  end

  context 'an admin member can view the volunteers details' do
    before do
      admin_sign_in
      volunteer = Volunteer.create(
        name: 'Steph',
        last_name: 'Test',
        address: '123ABC',
        mobile_number: '12345678900',
        post_code: 'E1 4RT',
        shopping: true,
        prescription_collection: false,
        snow_clearance: false,
        grit_spreading: false,
        dog_walking: false)
    end

    scenario 'the volunteer details are shown on the view volunteers page' do
      click_link 'View volunteer'
      expect(page).to have_content 'Steph'
      expect(page).to have_content 'true'
    end

  end
end
