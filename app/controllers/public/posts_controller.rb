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
    if params[:pg_lang_id].present?
      @posts = PgLang.find(params[:pg_lang_id]).posts
    else
      @posts = @applicant.posts
    end
  end

  
end

