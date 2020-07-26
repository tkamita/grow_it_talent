class User::OffersController < ApplicationController

  def index
    @applicant = current_applicant
  end

end
