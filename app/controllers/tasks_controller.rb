class TasksController < ApplicationController
  before_action :set_task_list, only: [:new, :create]

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.task_list = @task_list
    if @task.save
      redirect_to task_list_path(@task_list)
    else
      render :new
    end
  end

  private

  def set_task_list
    @task_list = TaskList.find(params[:task_list_id])
  end

  def task_params
    params.require(:task).permit(:task_list_id, :titre, :détails, :completed)
  end
end
