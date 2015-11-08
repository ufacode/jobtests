class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index; end

  def show; end

  def new; end

  def edit; end

  def create
    post.author = current_user
    if post.save
      redirect_to post_path(post), notice: t('.success')
    else
      render :new
    end
  end

  def update
    if post.update(post_params)
      redirect_to post_path(post), notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    post.destroy
    redirect_to posts_url, notice: t('success')
  end

  private

  def posts
    @posts ||= Post.page(params[:page]).per(10)
  end
  helper_method :posts

  def post
    @post ||= Post.new(post_params)
  end
  helper_method :post

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.fetch(:post, {}).permit(:title, :description, :image)
  end
end
