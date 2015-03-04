feature 'maps' do

  context 'Task Summary' do

    before do
      admin_sign_up
      admin_sign_in
      add_volunteer('Bob', 'Smith', 'email@test.com', '123 Street', 'SW1', '07555555555', true)
      add_volunteer('Tom', 'Smith', 'email@test.com', '123 Street', 'SW1', '07555555555', true)
      add_client('John', 'Smith', '456 Road', 'SW2', '01123456789')
    end

    scenario 'Show summary page' do
      click_on 'icon_add_task'
      select 'Shopping', from: 'Task type'
      fill_in 'Description', with: 'Bread'
      click_button 'Create Task'
      expect(page).to have_content 'Task Summary'
    end
  end
end
