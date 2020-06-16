class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build
    @user_id = current_user.id
  end

  def create
    task = Task.find(params[:task_id])
    @comment = task.comments.build(comment_params)
    if @comment.save
      redirect_to board_task_path(board_id: task.board_id, id: task.id)
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
