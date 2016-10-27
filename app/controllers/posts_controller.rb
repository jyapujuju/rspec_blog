 class PostsController < ApplicationController
  def index
    # @posts = Post.where(featured: false).limit(5)
    @posts = Post.not_featured.limit(3)

    @featured = Post.featured.last
    # @featured = Post.where(featured: true).first
  end

  def dashboard
    @articles = Post.order("created_at DESC").paginate(:page => params[:page], :per_page => 15  )
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
    @post.update(post_params)
    if @post.valid?
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
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
    params.require(:post).permit(:title,:author,:content,:featured)
  end
end
