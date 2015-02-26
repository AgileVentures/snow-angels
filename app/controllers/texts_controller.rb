class TextsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @texts = Text.all
    @available = Volunteer.where(availability: true)
    @unavailable = Volunteer.where(availability: false)
    @pending = Volunteer.where(availability: nil)
  end

  def create
    @text = Text.new

    @text.number = params['From']
    @text.body = params['Body']

    @text.volunteer = Volunteer.find_by(mobile_number: params['From'])

    if @text.save
      render xml: "<Response/>"
    end

  end

  def snow_text
    Text.text_all_volunteers
    flash[:notice] = "Angels have been notified"
    redirect_to pages_path
  end

  def volunteer_text
    Text.send_text(volunteer, "Dog walk")
    flash[:notice] = "Text sent"
    redirect_to pages_path
  end

end
