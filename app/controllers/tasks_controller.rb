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
      redirect_to match_path(@task)
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
    Task.set_volunteer_availability(params[:id], params[:volunteer])
    redirect_to pages_path
  end

  def show
    @task = Task.find(params[:id])
    @match_one = Task.set_match_one
    @match_two = Task.set_match_two
    @match_three = Task.set_match_three
    @volunteers = [@match_one, @match_two, @match_three]
  end

  def client_called
    @task = Task.find(params[:id])
    if @task.volunteer_id != nil
      @task.update(called_client: true)
      redirect_to pages_path
    else
      redirect_to pages_path
    end
  end

  def task_completed
    @task = Task.find(params[:id])
    if @task.volunteer_id != nil
      @task.update(task_done: true)
      redirect_to pages_path
    else
      redirect_to pages_path
    end
  end

  def task_params
    params.require(:task).permit(:volunteer_text_confirmed, :called_client, :task_done,
                                 :task_type, :description)
  end

end
