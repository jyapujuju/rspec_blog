 class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end



  def new
    @post = Post.new
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.fint(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def create
    @post = Post.create(post_params)
    if @post.valid?
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title,:author,:content)
  end
end
