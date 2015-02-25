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

end
