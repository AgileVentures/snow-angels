class Text < ActiveRecord::Base
  belongs_to :volunteer

  def send_text
    client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    account = client.account
    message = account.messages.create({:body => "It's snowing! Are you available to help today?",
          :to => ENV['PHONE_NO'],
          :from => ENV['TWILIO_NO']})
    puts message
  end
end
