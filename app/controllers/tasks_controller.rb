class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = current_user.tasks
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.save!
    flash[:info] = "Added task: #{@task.name}"
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:info] = "Donesies!!!"

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end

end