class Admin::BadgesController < Admin::BaseController
  
  before_action :set_badges, only: %i[index destroy]
  before_action :find_badge, only: %i[show edit update destroy start]

  def index
    @badges = Badge.all
  end

  def show

  end

  def new
    @badge = Badge.new
  end

  def edit

  end

  def create
    @badge = Badge.new(badge_params)
    
    
    if @badge.save
      redirect_to admin_badges_path, notice: 'success'
    else
      render :new
    end
  end

  def update

    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def destroy
    @badge.delete
    redirect_to admin_badges_path
  end

  private

  def set_badges
    @badges = Test.all
  end

  def badge_params
    params.require(:badge).permit(:title, :img_url, :rule)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end



end