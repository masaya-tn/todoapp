class TasksController < ApplicationController
    

    def index
      
    end

    def new
      @task = current_user.tasks.build
    end

    def create
      @task = current_user.tasks.build(task_params)
      if @task.save
        redirect_to task_path(@task)
      else
        render :new
      end
    end
    

    private
    def task_params
      params.require(:task).permit(:title, :content, :limit)
    end
end
    