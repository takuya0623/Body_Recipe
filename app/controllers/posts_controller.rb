class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posts = Post.page(params[:page]).per(4)
    if params[:is_light].present?
      @posts = Post.where(is_light: params[:is_light]).page(params[:page]).per(4)
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @user = @post.user
    
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
    redirect_to post_path(@post), notice: "投稿しました"
    else
    render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    if @post.user != current_user
      redirect_to posts_path,alert: '不正なアクセスです'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
    redirect_to post_path(@post), notice: "更新しました"
    else
    render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :calorie, :body, :image, :material, :procedure, :is_light)
  end

end
