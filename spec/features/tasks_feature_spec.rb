feature 'tasks' do
  
  context 'Add a task' do

    before do
      admin = Admin.new(email: 'test@example.com', password: 'testtest', password_confirmation: 'testtest')
      admin.save
      admin_sign_in
    end

    scenario 'Add a task to a client' do
      add_client
      visit '/'
      click_link 'View client'
      click_link 'Add a task'
      check 'Shopping'
      fill_in 'Shopping', with: 'Bread'
      click_button 'Submit'
      expect(page).to have_content 'Bread'
      expect(page).to have_content 'Shopping'
      expect(current_path).to eq '/pages'
    end

  end

end