class TasksController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def new
      board = Board.find(params[:board_id])
      @task = board.tasks.build
      @task_user_id = current_user.id
    end

    def create
      board = Board.find(params[:board_id])
      @task = board.tasks.build(task_params)
      if @task.save
        redirect_to board_path(board)
      else
        render :new
      end
    end
    
    def show
      @board = Board.find(params[:board_id])
      @task = @board.tasks.find(params[:id])
      @comments = @task.comments
    end

    def edit
      @board = Board.find(params[:board_id])
      @task = current_user.tasks.find(params[:id])
      @task_user_id = current_user.id
    end

    def update
      @task = current_user.tasks.find(params[:id])
      if @task.update(task_params)
        redirect_to board_path(params[:board_id])
      else
        render :edit
      end
    end

    def destroy
      task = current_user.tasks.find(params[:id])
      task.destroy!
      redirect_to board_path(params[:board_id])
    end

    private
    def task_params
      params.require(:task).permit(:title, :content, :limit, :user_id, :eyecatch)
    end
end
    