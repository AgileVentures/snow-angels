feature 'tasks' do

  context 'Add a task' do

    before do
      admin_sign_in
      add_volunteer('Josh', 'Test', 'one@test.com', '123 Fake Street', 'EC1 2DR', '+447791234567', 'true')
      add_volunteer('Steph', 'Test', 'one@test.com', '123 Fake Street', 'EC1 2DR', '+447791234567', 'true')
      add_volunteer('Bibiana', 'Test', 'one@test.com', '123 Fake Street', 'EC1 2DR', '+447791234567', 'true')
    end

    scenario 'Add a task to a client with available volunteers' do
      add_client('Tom', 'Smith', 'Makers', 'E1 2SF', '07450991234')
      visit '/'
      click_link 'View client'
      click_on 'icon_add_task'
      select 'Shopping', from: 'Task type'
      click_button 'Create Task'
      expect(page).to have_content 'Task successfully added'
      expect(page).to have_content 'Tom Smith'
      expect(page).to have_content 'Shopping'
      expect(page).to have_content '07450991234'
    end

  end

  context 'No volunteers are available' do

    before do
      admin_sign_in
    end

    scenario 'An error message will be displayed' do
      add_client('Tom', 'Smith', 'Makers', 'E1 2SF', '07450991234')
      create_task
      expect(page).to have_content 'There are no more unmatched volunteers'
    end

  end

end