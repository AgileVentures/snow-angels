feature "client" do

  before { admin_sign_in }

  context "Add client" do

    it "should be able display a form to add a client" do
      visit '/'
      click_link 'Add client'
      expect(page).to have_content 'Name'
      expect(page).to have_content 'Last name'
      expect(page).to have_content 'Address'
      expect(page).to have_content 'Postcode'
      expect(page).to have_content 'Phone'
    end

    it "should be able to create a client" do
      add_client('Tom', 'Smith', 'Makers', 'E1 2SF', '07450991234')
      expect(page).to have_content 'Client successfully added'
      expect(current_path).to eq '/clients'
    end

    it 'should display an invalid post code' do
      add_client('Tom', 'Smith', 'Makers', 'E1', '07450991234')
      click_link 'Add client'
      expect(page).to have_content 'Postcode invalid postcode'
    end

  end

  context "view client" do

    before do
      add_client('Tom', 'Smith', 'Makers', 'E1 2SF', '07450991234')
    end

    it "admin should be able to see client details" do
      visit '/'
      click_link 'View client'
      expect(page).to have_content 'Tom'
      expect(current_path).to eq '/clients'
    end

    it "should be able to search" do
      add_client('Other', 'Client', 'Makers', 'E1 2SF', '01234567890')
      visit '/'
      click_link 'View client'
      fill_in 'search', with: 'Tom'
      click_button 'Search'
      expect(page).to have_content('Tom')
      expect(page).not_to have_content('Bob')
    end

    it "should show clients by ascending last name order" do
      add_client('Bob', 'Jones', 'Makers', 'E1 2SF', '07450991234')
      visit '/'
      click_link 'View client'
      expect(page.body) =~ /Bob.*Tom/
    end

  end

  context 'edit client' do

    before do
      add_client('Tom', 'Smith', 'Makers', 'E1 2SF', '07450991234')
    end

    it 'should be able to change the details' do
      click_link 'View client'
      click_link 'Edit'
      fill_in 'Name', with: 'Thomas'
      click_button 'Update Client'
      click_link 'View client'
      expect(page).to have_content 'Thomas'
    end

  end

  context 'delete client' do

    before do
      add_client('Tom', 'Smith', 'Makers', 'E1 2SF', '07450991234')
    end

    it 'should be able to delete client' do
      click_link 'View client'
      click_link 'Delete'
      expect(page).not_to have_content 'Tom'
      expect(current_path).to eq '/pages'
    end

  end

end
