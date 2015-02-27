class TasksController < ApplicationController

  before_action :authenticate_admin!
  def index
    @tasks = Task.all
  end

  def new
    @client = Client.find(params[:id])
    @task = Task.new
  end

  def create
    client = Client.find(params[:id])
    @task = Task.new(task_params)
    @task.client = client
    if @task.save
      redirect_to '/pages'
      flash[:notice] = 'Task successfully added'
    else
      render 'new'
    end
  end

  def match
    @client = Client.find(params[:id])
    @available = Volunteer.where(availability: true)
    @task = Task.find(params[:id])
    @task.update(volunteer_id: @available.first.id ) if @available.first
    @available.first.update(availability: false)
    redirect_to pages_path
  end

  def task_params
    params.require(:task).permit(:volunteer_text_confirmed, :called_client, :task_done,
                                 :task_type, :description)
  end

end

