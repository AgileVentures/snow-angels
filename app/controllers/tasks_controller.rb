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
    @match_one = Volunteer.find(MatchTaskVolunteer.first.volunteer_id)
    @match_two = Volunteer.find(MatchTaskVolunteer.second.volunteer_id)
    @match_three = Volunteer.find(MatchTaskVolunteer.third.volunteer_id)
    @volunteers = [@match_one, @match_two, @match_three]
  end


  def task_params
    params.require(:task).permit(:volunteer_text_confirmed, :called_client, :task_done,
                                 :task_type, :description)
  end

end
