class TextsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @text = Text.new

    @text.number = params['From']
    @text.body = params['Body']

    @text.volunteer = Volunteer.find_by(mobile_number: params['From'])

    if @text.save
      render xml: "<Response/>"
    end

  end

  def index
    @texts = Text.all
    @available = Volunteer.where(availability: true)
    @unavailable = Volunteer.where(availability: false)
  end

  # def client
  #   Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
  # end

  # def send_text
  #   client.messages.create(
  #     from: ENV['TWILIO_NUMBER']
  #     to: ENV['PHONE_NO']
  #     body: message_body)
  # end

  # def message_body
  #   "It's snowing! Are you available to help today?"
  # end

end
