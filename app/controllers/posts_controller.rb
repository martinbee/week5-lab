class PostsController < ApplicationController

  def index
    @posts = Post.all.order('votes desc')
    render :index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new params.require(:post).permit(:title, :link)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find params[:id]
    @post.votes += 1
    @post.save
    redirect_to @post.link
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    if @post.update params.require(:post).permit(:title, :link)
      redirect_to :root
    else
      render :edit
    end
  end

  def delete
    @post = Post.find params[:id]
    @post.destroy
    redirect_to :root
  end

end
