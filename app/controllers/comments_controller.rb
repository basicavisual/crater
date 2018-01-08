class CommentsController < ApplicationController
  before_action :set_task

  def create
    @comment = @task.comments.create(comment_params)
    redirect_to @task
  end

  def edit
  end

  def update
    
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def comment_params
    params[:comment].permit(:content, :attachment)
  end
end
