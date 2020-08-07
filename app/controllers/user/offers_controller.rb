class User::OffersController < ApplicationController
  before_action :authenticate_applicant!

  def index
    @applicant = current_applicant
  end

end
