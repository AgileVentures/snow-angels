feature 'maps' do

  context 'Map functionality' do

    before do
      admin_sign_up
      admin_sign_in
      add_volunteer('Bob', 'Smith', 'email@test.com', '123 Street', 'SW1', '07555555555', true)
      add_volunteer('Tom', 'Smith', 'email@test.com', '123 Street', 'SW1', '07555555555', true)
      add_client('John', 'Smith', '456 Road', 'E1 6LT', '01123456789')
    end

    scenario 'has a map displayed' do
      click_on 'icon_add_task'
      select 'Shopping', from: 'Task type'
      fill_in 'Description', with: 'Bread'
      click_button 'Create Task'
      expect(page).to have_css('#multi_markers', :visible => true)
    end
  end
end
