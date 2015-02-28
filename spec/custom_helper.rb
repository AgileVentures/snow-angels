def add_client
  visit '/pages'
  click_link 'Add client'
  fill_in 'Name', with: 'Tom'
  fill_in 'Last name', with: 'Smith'
  fill_in 'Address', with: 'Makers'
  fill_in 'Postcode', with: 'E1 2SF'
  fill_in 'Phone', with: '07450991234'
  click_button 'Create Client'
end

def add_second_client
  visit '/pages'
  click_link 'Add client'
  fill_in 'Name', with: 'Bob'
  fill_in 'Last name', with: 'Jones'
  fill_in 'Address', with: 'Makers'
  fill_in 'Postcode', with: 'E1 3RT'
  fill_in 'Phone', with: '0777777888'
  click_button 'Create Client'
end

def add_volunteer
  visit '/'
  click_link 'Add volunteer'
  fill_in 'Name', with: 'Richard'
  fill_in 'Last name', with: 'Smith'
  fill_in 'Address', with: 'Address123'
  fill_in 'Post code', with: 'E1 6TD'
  fill_in 'Mobile number', with: '12345678910'
  check 'Shopping'
  check 'Grit spreading'
  click_button 'Create Volunteer'
end

def admin_sign_up
  admin = Admin.new(email: 'test@example.com', password: 'testtest', password_confirmation: 'testtest')
  admin.save
end

def admin_sign_in
  admin_sign_up
  visit '/'
  click_link 'Sign in'
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'testtest'
  click_button 'Log in'
end