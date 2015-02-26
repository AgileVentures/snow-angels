class Text < ActiveRecord::Base
  belongs_to :volunteer

  def self.text_all_volunteers
    volunteers = Volunteer.all
    account = create_client
    message = "It's awful weather! #{volunteer.name} are you available to help today? Snow Angels"
    volunteers.each {|volunteer| build_message(account, volunteer, message)}
  end

  def self.send_text(volunteer, body)
    account = create_client
    message = account.messages.create({
      :body => body,
      :to => volunteer.mobile_number,
      :from => ENV['TWILIO_NO']
    })
  end

  private

  def create_client
    client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    client.account
  end

  def build_message(account, volunteer, body)
    account.messages.create({
      :body => body,
      :to => volunteer.mobile_number,
      :from => ENV['TWILIO_NO']
    })
  end
end
