class GenresController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_genre, only:[:show, :edit, :update, :destroy]
  
  def index
    @genres = Genre.order(id: :desc)
  end

  def show
    
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = '新しいジャンルを作成しました。'
      redirect_to genres_path
    else
      flash[:danger] = 'ジャンルの作成に失敗しました。'
      render :new
    end 
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      flash[:success] = "ジャンルの編集が完了しました。"
      redirect_to genres_path
    else
      flash[:danger] = "ジャンルの編集に失敗しました。"
      render :edit
    end 
  end

  def destroy
    @genre.destroy
    flash[:success] = "ジャンルを削除しました。"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def set_genre
    @genre = Genre.find(params[:id])
  end
  
  def genre_params
    params.require(:genre).permit(:name)
  end
  
  def require_admin
    redirect_to root_url unless current_user.admin
  end
  
end
