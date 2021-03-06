class UsersController < ApplicationController
    before_action :require_user_logged_in, only: [:index, :show]
    
 # def index
  #end

  #def show
   # @user = User.find(params[:id])
    #@tasks = @user.tasks.order(id: :desc).page(params[:page])
  #end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザーを登録しました"
      redirect_to tasks_path
    
    else
      flash.now[:danger] = "ユーザー登録に失敗しました"
      render :new
    end
  end
end


private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
