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

  def destroy
    @task = Task.find(params[:id])
    Rails.logger.info "Suppression de la tâche"
    if @task.destroy
      redirect_to tasks_path, notice: "La tâche a été supprimée avec succès."
    else
      redirect_to @task_list, alert: "Une erreur s'est produite lors de la suppression de la tâche."
    end
  end

  def index
    @task_list = TaskList.find(params[:task_list_id])
    @tasks = @task_list.tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:task_list_id, :titre, :détails, :completed)
  end
end
