class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new params.require(:post).permit(:title, :link)
    if @post.save
      redirect_to :root
    else
      render :new
    end
  end

  def edit
  end
end
