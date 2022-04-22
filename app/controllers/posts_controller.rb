class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:date, :rationale))
    @post.save
    # We don't want a create template, we want to render a show template
    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end
end
