class Text < ActiveRecord::Base
  belongs_to :volunteer

  def send_text
    volunteers = {
      "+44" => "Bibiana",
      "+44" => "Steph"
    }
    client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    account = client.account
    volunteers.each do |key, value|
      message = account.messages.create({:body => "It's snowing! #{value} are you available to help today?",
            :to => key,
            :from => ENV['TWILIO_NO']})
      puts message
    end
  end
end
