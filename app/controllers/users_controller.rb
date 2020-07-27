class UsersController < ApplicationController
  
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    # @users = User.order(id: :desc).page(params[:page]).per(25)
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
      
      
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
    
    #仮置き
    # @user = User.new(user_params)
    # if @user.save
    #   redirect_to login_path
    # else
    #   render 'new'
    # end
    
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  #仮置き
  # private
  
  # def user_params
  #   params.require(:user).permit(:name, :mail, :password, :password_confirmation)
  # end
  
end
