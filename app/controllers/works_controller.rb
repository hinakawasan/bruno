class WorksController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_work, only: [:show, :edit, :update]
  before_action :genre_options, only: [:new, :edit]
  
  def index
    @works = Work.order(id: :desc).page(params[:page])
  end

  def show
  end

  def new
    @work = current_user.works.build
  end
  
  def create
    @work = current_user.works.build(work_params)
    if @work.save
      flash[:success] = 'ポートフォリオを公開しました。'
      redirect_to work_path(@work)
    else
      flash[:danger] = 'ポートフォリオの公開に失敗しました。'
      render :new
    end
  end 

  def edit
  end

  def update
    if @work.update(work_params)
      flash[:success] = 'ポートフォリオを更新しました。'
      redirect_to work_path(@work)
    else
      flash[:danger] = 'ポートフォリオの更新に失敗しました。'
      render :edit
    end 
  end

  def destroy
    @work.destroy
    flash[:success] = 'ポートフォリオを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def set_work
    @work = Work.find(params[:id])
  end
  
  def correct_user
    @work = current_user.works.find_by(id: params[:id])
    redirect_to root_url unless @work
  end
  
  def work_params
    params.require(:work).permit(:title, :media_id, :explanation, :genre_id)
  end
  
  def genre_options
    @genre_options = []
    Genre.all.each do |genre|
      @genre_options << [genre.name, genre.id]
    end
  end
end
