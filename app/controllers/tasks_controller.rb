class TasksController < ApplicationController

  before_action :authenticate_admin!
  def index
    @tasks = Task.all
    @matches = MatchTaskVolunteers.all
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
      redirect_to pages_path
      flash[:notice] = 'Task successfully added'
    else
      render 'new'
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to pages_path
  end

  def match_one_volunteer
    @task = Task.find(params[:id])
    @task.volunteer_id = Volunteer.find(params[:volunteer]).id
    @task.save
    redirect_to pages_path
  end

  def show
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:volunteer_text_confirmed, :called_client, :task_done,
                                 :task_type, :description)
  end

end
