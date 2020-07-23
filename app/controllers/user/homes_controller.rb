class User::HomesController < ApplicationController

  def top
    @post = Post.new
    @pg_langs = PgLang.all
  end

  def about
    
  end
  
end
