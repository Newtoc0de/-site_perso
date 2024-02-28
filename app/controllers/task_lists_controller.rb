class TaskListsController < ApplicationController
  def index
    @task_lists = TaskList.all
  end

  def new
    @task_list = TaskList.new
  end

  def create
    @task_list = TaskList.new(task_list_params)
    @task_list.user = current_user
    if @task_list.save
      redirect_to task_list_path(@task_list)
    else
      render :new
    end
  end

  private

  def task_list_params
    params.require(:task_list).permit(:user_id)
  end
end
