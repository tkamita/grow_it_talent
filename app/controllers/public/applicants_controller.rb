class Public::ApplicantsController < ApplicationController
  before_action :authenticate_corporation!

  def index
    @applicants = Applicant.all.order(created_at: :desc)
    date_format = "%Y%m%d"
  end
  
  def show
    @applicant = Applicant.find(params[:id])
    @room = Room.find_by(applicant_id: params[:applicant_id], corporation_id: current_corporation.id)
    @offer = Offer.new
  end


  def work
    @applicant = Applicant.find(params[:id])
  end

end
