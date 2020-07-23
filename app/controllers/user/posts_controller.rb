class User::PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_post(@post)
    else
      # @post = Post.new
      @pg_langs = PgLang.all
      render 'homes/top'
    end
  end

  def show
    @post = Post.find(params[:id])
  end
  
  
  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end

