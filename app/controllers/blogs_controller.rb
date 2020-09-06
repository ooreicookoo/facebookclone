class BlogsController < ApplicationController
  def index
  end
  def new
    @blog = Blog.new
  end
  def create
    Blog.create(title: params[:blog][:title], content: params[:blog][:content])
    redirect_to "/blog/new"
  end
end
