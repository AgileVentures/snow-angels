def add_client(first_name, last_name, address, postcode, phone)
  visit '/pages'
  click_link 'Add client'
  fill_in 'Name', with: first_name
  fill_in 'Last name', with: last_name
  fill_in 'Address', with: address
  fill_in 'Postcode', with: postcode
  fill_in 'Phone', with: phone
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

def admin_sign_in
  admin_sign_up
  visit '/'
  click_link 'Sign in'
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'testtest'
  click_button 'Log in'
end

def admin_sign_up
  Admin.create(email: 'test@example.com', password: 'testtest', password_confirmation: 'testtest')
end

def build_volunteer
  Volunteer.create(name: 'Josh', last_name: 'Bebb', post_code: 'EC1 2DR', mobile_number: '+447791234567', address: 'XYZ', availability: nil)
end

def build_text(volunteer, body)
  Text.create(number: '+447791234567', body: body, volunteer_id: volunteer.id)
end
