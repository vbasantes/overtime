class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    #Why is this not working?!
    @post.user_id = current_user.id

    # We don't want a create template, we want to render a show template
    if @post.save
      redirect_to @post, notice: "Post created successfully"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Your post was edited successfully"
    else
      render :edit
    end
  end

  private

    def post_params
      params.require(:post).permit(:date, :rationale)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
