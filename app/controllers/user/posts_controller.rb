class User::PostsController < ApplicationController

  def index
    @posts = current_applicant.posts
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_post_path(@post)
    else
      render 'homes/top'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_posts_path
    else
      render :show
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path
  end
  
  
  private
  def post_params
    params.require(:post).permit(:applicant_id, :pg_lang_id, :title, :content)
  end
end

