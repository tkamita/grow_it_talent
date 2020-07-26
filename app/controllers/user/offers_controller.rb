class User::OffersController < ApplicationController

  def index
    @applicant = current_applicant
  end

  def create
    @offer = current_corporation.offers.create(applicant_id: params[:applicant_id])
    redirect_to public_applicant_path(@offer.applicant_id)
  end

  def destroy
    @offer = Offer.find_by(applicant_id: params[:applicant_id], corporation_id: current_corporation.id)
    @offer.destroy
    redirect_to public_applicant_path(@offer.applicant_id)
  end
  
end
