class TasksController < ApplicationController

    def new
      board = Board.find(params[:board_id])
      @task = board.tasks.build
      @board_user_id = current_user.id
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
      board = Board.find(params[:board_id])
      @task = tasks(params[:id])
    end

    private
    def task_params
      params.require(:task).permit(:title, :content, :limit, :user_id, :eyecatch)
    end
end
    