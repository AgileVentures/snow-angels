class TasksController < ApplicationController

  before_action :authenticate_admin!
  before_action only: [:new, :create] { @client = find_client(params) }
  before_action only: [:update, :show, :client_called, :task_completed] { @task = find_task(params) }

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.client = @client
    if @task.save
      redirect_to match_path(@task)
      flash[:notice] = 'Task successfully added'
    else
      render 'new'
    end
  end

  def update
    @task.update(task_params)
    redirect_to pages_path
  end

  def match_one_volunteer
    Task.set_volunteer_availability(params[:id], params[:volunteer])
    redirect_to pages_path
  end

  def show
    @match_one = Task.set_match_one
    @match_two = Task.set_match_two
    @match_three = Task.set_match_three
    @volunteers = [@match_one, @match_two, @match_three]
  end

  def client_called
    if @task.volunteer_id != nil
      @task.update(called_client: true)
      redirect_to pages_path
    else
      redirect_to pages_path
    end
  end

  def task_completed
    if @task.volunteer_id != nil
      @task.update(task_done: true)
      redirect_to pages_path
    else
      redirect_to pages_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:volunteer_text_confirmed, :called_client,
                                 :task_done, :task_type, :description)
  end

  def find_client(params)
    Client.find(params[:id])
  end

  def find_task(params)
    Task.find(params[:id])
  end

end
