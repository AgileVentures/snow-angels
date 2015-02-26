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
      select 'Shopping', from: 'Task type'
      click_button 'Create Task'
      expect(page).to have_content 'Task successfully added'
    end

  end

end