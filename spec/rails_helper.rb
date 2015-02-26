# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

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
    click_link 'Register'
    fill_in 'Name', with: 'Richard'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Address', with: 'Address123'
    fill_in 'Post code', with: 'E1 6TD'
    fill_in 'Mobile number', with: '12345678910'
    check 'Shopping'
    click_button 'Create Volunteer'
  end

  def admin_sign_in
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'testtest'
    click_button 'Log in'
  end
end
