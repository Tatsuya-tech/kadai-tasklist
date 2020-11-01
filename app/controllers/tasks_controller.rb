class TasksController < ApplicationController
    
  def index
      @tasks = Task.all
  end

  def show
      @task =Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "正常に作成されました"
      redirect_to @task
    
    else
      flash.now[danger] = "作成に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content)
  end

end