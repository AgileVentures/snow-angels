feature "Volunteer" do

  context "On the homepage" do
    scenario "Can Register" do
      visit '/'
      expect(page).to have_link 'Register'
    end
  end

  context "Add volunteer" do

    before { admin_sign_in }

    it "should be able to display a form to add a volunteer" do
      visit '/'
      click_link 'Add volunteer'
      expect(page).to have_field 'First name'
      expect(page).to have_field 'Last name'
      expect(page).to have_field 'Address'
      expect(page).to have_field 'Postcode'
      expect(page).to have_field 'Mobile number'
      expect(page).to have_field 'Email'
      expect(page).to have_field 'Shopping'
      expect(page).to have_field 'Prescription collection'
      expect(page).to have_field 'Snow clearance'
      expect(page).to have_field 'Grit spreading'
      expect(page).to have_field 'Dog walking'
    end

    it "should be able to create a volunteer" do
      add_volunteer('Josh', 'Test', 'one@test.com', '123 Fake Street', 'EC1 2DR', '+447791234567', nil)
      expect(current_path).to eq '/'
    end

    it "should be able to add a +44 in the database before the mobile phone" do
      click_link 'Add volunteer'
      fill_in 'First name', with: 'Bob'
      fill_in 'Last name', with: 'Jones'
      fill_in 'Address', with: 'Makers'
      fill_in 'Postcode', with: 'EC1 2DR'
      fill_in 'Mobile number', with: '07791234567'
      fill_in 'Email', with: 'test@test.com'
      click_button 'Create Volunteer'
      click_link 'View volunteers'
      expect(page).to have_content '+447791234567'
    end

  end

  context "view volunteer" do

    before do
      admin_sign_in
      add_volunteer('Josh', 'Test', 'one@test.com', '123 Fake Street', 'EC1 2DR', '+447791234567', nil)
      add_volunteer('Bibiana', 'Test', 'one@test.com', '123 Fake Street', 'EC1 2DR', '+447791234567', nil)
      click_link 'View volunteer'
    end

    it "An admin should be able to see volunteers details" do
      expect(page).to have_content '123 Fake Street'
      expect(page).to have_content '+447791234567'
      expect(page).to have_content 'Josh'
      expect(page).to have_content 'Bibiana'
    end

    it "An admin should be able to search a volunteer details" do
      fill_in 'search', with: 'Josh'
      click_button 'Search'
      expect(page).to have_content('Josh')
      expect(page).not_to have_content('Bibiana')
    end

    it "should show volunteers by descending created at" do
      expect(page.body) =~/Bibiana.*Josh/
    end

  end

  context "edit and delete volunteer" do

    before do
      admin_sign_in
      add_volunteer('Josh', 'Test', 'one@test.com', '123 Fake Street', 'EC1 2DR', '+447791234567', nil)
      click_link 'View volunteer'
    end

    it "An admin should be able to edit volunteers details" do
      click_link 'Edit'
      fill_in 'Address', with: '3a New Street'
      click_button 'Update Volunteer'
      expect(page).to have_content '3a New Street'
    end

    it "An admin should be able to delete volunteers details" do
      click_link 'Delete'
      expect(page).not_to have_content 'Josh'
      expect(page).not_to have_content 'Test'
    end

  end

  context "Available and unavailable" do

    before do
      admin_sign_in
    end

    it "An admin should be able to set up a volunteer available" do
      vol1 = add_volunteer('Josh', 'Test', 'one@test.com', 'XYZ', 'EC1 2DR', '+447791234567', nil)
      build_text(vol1, 'Yes I can help today')
      visit texts_path
      click_link 'Available'
      save_and_open_page
      expect(page.find('.available')).to have_link('Josh')
      expect(vol1.reload.availability).to be true
    end

    it "An admin should be able to set up a volunteer unavailable" do
      vol1 = add_volunteer('Josh', 'Test', 'one@test.com', 'XYZ', 'EC1 2DR', '+447791234567', nil)
      build_text(vol1, 'Sorry I cannot help today')
      visit texts_path
      click_link 'Not Available'
      expect(page.find('.unavailable')).to have_link('Josh')
      expect(vol1.reload.availability).to be false
    end

  end

end
