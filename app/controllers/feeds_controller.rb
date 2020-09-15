class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_with_http_digest, only: [:new, :confirm, :create, :edit, :update, :destroy]
  def index
    @feeds = Feed.all
  end

  def show
  end

  def new
    if params[:back]
      @feed = current_user.feeds.build(feed_params)
    else
      @feed = current_user.feeds.build
    end
  end

  def edit
  end

  def create
    @feed = current_user.feeds.new(feed_params)
    if @feed.save
      redirect_to feeds_path, notice: '投稿に成功しました'
    else
      flash.now[:denger] = '投稿に失敗しました'
      render :new
    end
  end
  # def create
  #   @feed = current_user.feeds.build(feed_params)
  #   respond_to do |format|
  #     if @feed.save
  #       format.html { redirect_to @feed, notice: '投稿に成功しました' }
  #       format.json { render :show, status: :created, location: @feed }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @feed.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: 'Feed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def confirm
    @feed = current_user.feeds.build(feed_params)
  end
  private
    def set_feed
      @feed = Feed.find(params[:id])
    end
    def feed_params
      params.require(:feed).permit(:content, :image, :image_cache)
    end
end
