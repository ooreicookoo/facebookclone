class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end
  def new
    @blog = Blog.new
  end
  def create
    Blog.create(blog_params)
    redirect_to new_blog_path
  end
  def show
  end

  end
  private
  def blog_params
    params.require(:blog).permit(:content)
  end
end
