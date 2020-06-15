class TasksController < ApplicationController

    def new
      board = Board.find(params[:board_id])
      @task = board.tasks.build
      @board_user_id = current_user.id
    end

    def create
      board = Board.find(params[:board_id])
      @task = board.tasks.build(task_params)
      if @task.save!
        redirect_to boards_path
      else
        render :new
      end
    end
    

    private
    def task_params
      params.require(:task).permit(:title, :content, :limit, :user_id)
    end
end
    