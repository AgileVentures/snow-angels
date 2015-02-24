require 'rails_helper'

context "admin not signed in and on the homepage" do
  it "should see a 'sign in' link" do
    visit '/'
    expect(page).to have_link 'Sign in'
  end

  it "should not see 'sign up' or 'sign out' link" do
    visit '/'
    expect(page).not_to have_link 'Sign up'
    expect(page).not_to have_link 'Sign out'
  end
end

context "admin signed in on the homepage" do

  before do
    admin = Admin.new(email: 'test@example.com', password: 'testtest', password_confirmation: 'testtest')
    admin.save
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'testtest'
    click_button 'Log in'
  end

  it "should see 'sign out' link" do
    visit '/pages'
    expect(page).to have_link 'Sign out'
  end

  it "should not see a 'sign in'" do
    visit '/'
    expect(page).not_to have_link 'Sign in'
  end

end