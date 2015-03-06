[![Code Climate](https://codeclimate.com/github/bebbs/snow-angels/badges/gpa.svg)](https://codeclimate.com/github/bebbs/snow-angels)
[![Test Coverage](https://codeclimate.com/github/bebbs/snow-angels/badges/coverage.svg)](https://codeclimate.com/github/bebbs/snow-angels)

# Snow Angels - Makers Academy Final Project
The Horsell Snow Angels is a non-profit organization based in Surrey (UK). Their aim is to help elderly people during poor weather conditions with tasks that they would usually be able to do alone, eg walking their dog.

Prior to this program being created, the process was manual. For example, text message responses were copied and pasted one by one into an Excel file to record volunteers' availability. The process to match a suitable volunteer to a task was done by checking a paper map.

Our task for our final project at Makers Academy was to automate the process for Horsell Snow Angels as much as possible. We focused on automating the admin's role, as the communication with volunteers and clients needed to remain the same.

## Technologies

- Ruby on Rails
- Javascript
- HTML
- CSS
- PostgreSQL
- Unix
- RSpec
- Capybara
- Google Maps API
- Twilio

## Contributors

- [Bibiana Cristofol](https://github.com/BibianaC)
- [Jake Alvarez](https://github.com/jakealvarez)
- [Josh Bebbington](https://github.com/bebbs)
- [Richard Ighodaro](https://github.com/iggyster3)
- [Steph Oldcorn](https://github.com/stepholdcorn)

## Installation

1. Before downloading Snow Angels:
  - Install [PostgreSQL](http://www.postgresql.org)

2. Download the code:
  - `$ git clone https://github.com/bebbs/snow-angels`

3. Install the gems:
  - `$ bundle install`

4. Create the database:
  - `$ bin/rake db:create db:migrate`

5. Set up Twilio:
  - Create a [Twilio](https://www.twilio.com) account
  - Place your Auth Token, Account SID, phone number and Twilio number into your bash profile or secret key base

6. Set up overnight volunteer availability reset in your server
  - `$ crontab -e`
  - Then you will be in vi in control mode
  - To switch to insert mode, press i
  - `@midnight cd PROGRAM_PATH && bin/rails runner "ResetVolunteerAvailability.reset"`
    - To find the path of the program, do `$pwd` 
  - Press Esc to go back to control mode
  - `:wq`
  - To set up an email to receive notifications if the job fails or produces any output: `MAILTO=Computer_username`
    - To be able to do this, an email must be configured in the system for that user

7. Test the code:
  - `$ rspec`




