class FeedsController < ApplicationController
  before_action :select_feed, only: [:show, :update, :destroy]
  before_action :authenticate_with_http_digest, only: [:new, :confirm, :create, :edit, :update, :destroy]

  def top
    @feeds = Feed.all
    if logged_in?
      @user = User.find(current_user.id)
    else
      @user = User.new
    end
  end

  def show
  end

  def new
    @feed = current_user.feeds.new
  end

  def confirm
    @feed = current_user.feeds.build(feed_params)
    if @feed.invalid?
      flash.now[:danger] = 'エラー！内容が未記入です'
      render :new
    end
  end

  def create
    @feed = current_user.feeds.build(feed_params)
    if @feed.save
      redirect_to user_path(current_user.id)
    else
      flash.now[:denger] = '投稿に失敗しました。内容が未記入です'
      render :new
    end
  end

  def edit
  end


  def update
    respond_to do |format|
      if @feed.update(feed_params)
        redirect_to user_path(current_user.id)
      else
        flash.now[:danger] = 'エラーがあります'
        render :edit
      end
    end
  end

  def destroy
    @feed.destroy
    flash[:notice] = '投稿を消去しました'
    redirect_to user_path(current_user.id)
  end


  private
    def select_feed
      @feed = Feed.find(params[:id])
    end

    def feed_params
      params.require(:feed).permit(:image, :image_cache, :content)
    end
end
