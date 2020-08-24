class User::HomesController < ApplicationController
  before_action :authenticate_applicant!

  def top
    @post = Post.new
    @offers = current_applicant.offers
    @rooms = current_applicant.rooms
    @applicant = current_applicant
  end

  def about
  end
  
end
