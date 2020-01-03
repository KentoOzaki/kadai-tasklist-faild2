class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end
    
    def show
        @task = Task.find(params[:id])
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = Task.new(task_params)
        
        if @task.save
            flash[:success] = 'succeeded to create new task'
            redirect_to @task
        else
            flash.now[:danger] = "faild to create new task"
            render :new
        end
    end
    
    def edit
        @task = Task.find(params[:id])
    end
    
    def update
        @task = Task.find(params[:id])
        
        if @task.update(task_params)
            flash[:success] = "succeeded to update task"
            redirect_to @task
        else 
            flash[:danger] = "faild to update task"
            render :edit
        end
    end
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        
        flash[:success] = "deletion was completed"
        redirect_to tasks_url
        
    end
    
    private
    def task_params
        params.require(:task).permit(:content)
    end
end