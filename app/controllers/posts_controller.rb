class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
 
  def create
    post = Post.create(post_params(:title, :content, category_ids:[], categories_attributes: [:name]))
    redirect_to post
  end

  # def update
  #   post = Post.find(params[:id])
  #   post.update(post_params(:title, :content, category_ids:[], :comment_content, categories_attributes: [:name]))
  # end

  private

  def post_params(*args)
    params.require(:post).permit(*args)
  end
end
