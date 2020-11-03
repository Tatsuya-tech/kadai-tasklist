class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
    
  def index
      @tasks = Task.all
  end

  def show
      set_task
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
      flash.now[:danger] = "作成に失敗しました"
      render :new
    end
  end

  def edit
    set_task
  end

  def update
    set_task
    
    if @task.update(task_params)
      flash[:success] = "正常に更新されました"
      redirect_to @task
    
    else
      flash.now[:danger] = "更新されませんでした"
      render :edit
    end
  end

  def destroy
    set_task
    @task.destroy
    
    flash[:success] = "正常に削除されました"
    redirect_to tasks_url
  end
  
  private
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end

end
