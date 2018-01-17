class CommentsController < ApplicationController

  before_action :set_task
  before_action :set_comment, except: [:index, :new, :create]

  def show
    @task = set_task
    @comments = @task.comments.all
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = @task.comments.build(comment_params)
    if @comment.save
      redirect_to project_task_path(@project, @task)
    else
      render :new, notice: 'Comment was not saved'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to project_task_path(@project, @task), notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @comment.destroy
      flash[:success] = "Comment was deleted."
    else
      flash[:error] = "Comment could not be deleted."
    end
    redirect_to project_task_path(@project, @task)
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
    @project = Project.find(@task.project_id)
  end

  def set_comment
    @comment = @task.comments.find(params[:id])
  end

  def comment_params
    params[:comment].permit(:content, :attachment)
  end
end
