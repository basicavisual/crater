class TasksController < ApplicationController
  before_action :set_project
  # before_action :set_task, except: [:create]

  def index
    @tasks = @project.tasks.all
  end

  def show
    @task = Tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit

    @task = @project.tasks.find(params[:id])
  end

  def create

    @task = @project.tasks.build(task_params)
    if @task.save
      redirect_to @project, notice: 'Task was successfully saved'
    else
      render :new
    end
  end

  def update
    @task = @project.tasks.find(params[:id])
      if @task.update(task_params)
        redirect_to @project, notice: 'Task was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    if @task.destroy
      flash[:success] = "Task was deleted."
    else
      flash[:error] = "Task could not be deleted."
    end
    redirect_to @project
  end

  private

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:name, :deadline, :project_id)
  end
end
