class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    #@post = Post.all
    @posts = Post.paginate(page: params[:page], per_page: 5)
  end

  def show

  end

  def new
    @post = Post.new
  end

  def edit

  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Post deleted!'
  end

  def update
    # if @post.update_attributes(post_params)
    if @post.update(post_params)
      redirect_to @post, success: 'Post updated!'
    else
      flash[:danger] = 'Post not updated! Please, try again.'
      render :edit
    end
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, info: 'Post created!'
    else
      #render :new, warning: 'Post not created! Please, try again.'
      flash[:warning] = 'Post not created! Please, try again.'
      render :new
    end
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags, :category_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
