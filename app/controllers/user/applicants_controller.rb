class User::ApplicantsController < ApplicationController
  
  def show
  end

  def edit
    @applicant = current_applicant
  end
end
