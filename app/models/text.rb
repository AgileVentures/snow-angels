class Text < ActiveRecord::Base
  belongs_to :volunteer

  def self.send_text(volunteer, custom_body)
    client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    account = client.account
    message = account.messages.create({
      :body => custom_body,
      :to => volunteer.mobile_number,
      :from => ENV['TWILIO_NO']
    })
  end

end
