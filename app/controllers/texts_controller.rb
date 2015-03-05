class TextsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @old_texts = Text.old_texts
    @todays_texts = Text.todays_texts
    @volunteers = Volunteer.all
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
    volunteers = Volunteer.all
    volunteer = volunteers.each do |volunteer|
      Text.send_text(volunteer, params[:custom_body])
    end
    flash[:notice] = "Angels have been notified"
    redirect_to pages_path
  end

  def volunteer
    volunteer = Volunteer.find(params[:id])
    Text.send_text(volunteer, (params[:custom_body]))
    flash[:notice] = "Text sent"
    redirect_to pages_path
  end

end
