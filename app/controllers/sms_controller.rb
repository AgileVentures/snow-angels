class SmsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @sms = Sms.new
    
    @sms.number = params['From']
    @sms.body = params['Body']

    @sms.volunteer = Volunteer.find_by(mobile_number: params['From'])
    
    if @sms.save
      render xml: "<Response/>"
    end

  end

  def index
    @sms = Sms.all
  end

end
