def add_client(first_name, last_name, address, postcode, phone)
  visit '/pages'
  click_link 'Add client'
  fill_in 'First name', with: first_name
  fill_in 'Last name', with: last_name
  fill_in 'Address', with: address
  fill_in 'Postcode', with: postcode
  fill_in 'Phone', with: phone
  click_button 'Create Client'
end

def add_volunteer(first_name, last_name, email, address, post_code, phone, availability)
  Volunteer.create(
    name: first_name,
    last_name: last_name,
    email: email,
    address: address,
    post_code: post_code,
    mobile_number: phone,
    availability: availability,
    shopping: true,
    dbs: true
  )
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

def build_text(volunteer, body)
  Text.create(number: '+447791234567', body: body, volunteer_id: volunteer.id)
end

def create_task
 visit '/'
 click_link 'View client'
 click_on 'icon_add_task'
 select 'Shopping', from: 'Task type'
 click_button 'Create Task'
end
