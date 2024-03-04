class TasksController < ApplicationController
  def new
    @task_list = TaskList.find(params[:task_list_id])
    @task = Task.new
  end

  def create
    @task_list = TaskList.find(params[:task_list_id])
    @task = @task_list.tasks.build(task_params)

    if @task.save
      redirect_to task_list_path(@task_list)
    else
      Rails.logger.error @task.errors.full_messages.inspect
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:task_list_id, :titre, :détails, :completed)
  end
end
