class User::HomesController < ApplicationController

  def top
    @post = Post.new
    @offers = current_applicant.offers
    @rooms = current_applicant.rooms
    @applicant = current_applicant
  end

  def about
  end
  
end
