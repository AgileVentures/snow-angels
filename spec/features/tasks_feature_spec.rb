feature 'tasks' do
  
  context 'Add a task' do

    before { admin_sign_in }

    scenario 'Add a task to a client' do
      add_client('Tom', 'Smith', 'Makers', 'E1 2SF', '07450991234')
      visit '/'
      click_link 'View client'
      click_link 'Add a task'
      select 'Shopping', from: 'Task type'
      click_button 'Create Task'
      expect(page).to have_content 'Task successfully added'
    end

  end

end