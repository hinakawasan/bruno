class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update] 
  before_action :require_user_logged_in, only: [:show, :edit, :edit, :update, :destroy]
  
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
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'マイページを更新しました。'
      redirect_to @user
    else
      flash[:danger] = 'マイページの更新に失敗しました。'
      render :edit
    end 
  end

  def destroy
    @user.destroy
    flash[:success] = '退会手続きが完了しました。'
    redirect_back(fallback_location: root_path)
    
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end 
  
  def correct_user
    @user = current_user
    redirect_to root_url unless @user
  end
  
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :description)
  end
end
