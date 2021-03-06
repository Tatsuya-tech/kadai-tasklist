class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

      
  def index

      @tasks = current_user.tasks.order(id: :desc)
  end
    
  

  def show
      set_task
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = "正常に作成されました"
      redirect_to tasks_path
    
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
      redirect_to tasks_path
    
    else
      flash.now[:danger] = "更新されませんでした"
      render :edit
    end
  end

  def destroy
    set_task
    @task.destroy
    
    flash[:success] = "正常に削除されました"
    redirect_to tasks_path
  end
  
  private
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end

  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_path
    end
  end

  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end

end
