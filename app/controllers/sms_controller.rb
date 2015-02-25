class SmsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @sms = Sms.new
    @sms.number = params['From']
    @sms.body = params['Body']
    if @sms.save
      render xml: "<Response/>"
    end
  end
  
end
