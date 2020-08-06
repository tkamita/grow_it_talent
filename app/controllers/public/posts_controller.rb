class Public::PostsController < ApplicationController
  before_action :authenticate_corporation!

  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def specific_index
    @applicant = Applicant.find(params[:id])
    @posts = @applicant.posts
  end
  
end

