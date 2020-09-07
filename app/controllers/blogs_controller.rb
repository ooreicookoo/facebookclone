class BlogsController < ApplicationController
  before_action :set_blog, only: [:snow, :edit, :update]
  def index
    @blogs = Blog.all
  end
  def new
    @blog = Blog.new
  end
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: '投稿しました！'
    else
      render :new
    end
  end
  def show
  end
  def edit
  end
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "投稿を編集しました"
    else
      render :edit
    end
  end
  private
  def blog_params
    params.require(:blog).permit(:content)
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
