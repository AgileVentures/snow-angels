class SmsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    puts params['From']
    puts params['Body']
    render xml: "<Response/>"
  end
end
