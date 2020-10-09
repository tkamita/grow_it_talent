class Public::OffersController < ApplicationController
  before_action :authenticate_corporation!

  def create
    @offer = current_corporation.offers.create(applicant_id: params[:applicant_id])
    @offer.create_notification_offer(@offer.corporation.id, @offer.id, @offer.applicant.id)
    redirect_to public_applicant_path(@offer.applicant_id)
  end

end
