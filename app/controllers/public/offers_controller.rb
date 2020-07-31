class Public::OffersController < ApplicationController

  def create
    @offer = current_corporation.offers.create(applicant_id: params[:applicant_id])
    # applicant = Applicant.find(params[:applicant_id])
    # applicant.create_notification_offer(current_applicant)
    @offer.create_notification_offer(@offer.corporation.id, @offer.id, @offer.applicant.id)
    redirect_to public_applicant_path(@offer.applicant_id)
  end

  # def destroy
  #   @offer = Offer.find_by(applicant_id: params[:applicant_id], corporation_id: current_corporation.id)
  #   @offer.destroy
  #   redirect_to public_applicant_path(@offer.applicant_id)
  # end
  
end
