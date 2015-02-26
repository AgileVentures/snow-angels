class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @client = Client.find(params[:client_id])
    @task = Task.new
  end

end
