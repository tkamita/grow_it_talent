class Public::ApplicantsController < ApplicationController
  before_action :authenticate_corporation!
  before_action :calculation_age, except: [:index]  

  def index
    @applicants = Applicant.all.order(created_at: :desc)
    date_format = "%Y%m%d"
    @applicants.each do |a|
      @birthday = a.birth_date.to_date
    end
    @age = (Date.today.strftime(date_format).to_i - @birthday.strftime(date_format).to_i) / 10000
  end
  
  def show
    @room = Room.find_by(applicant_id: params[:applicant_id], corporation_id: current_corporation.id)
    @offer = Offer.new
  end


  def work
  end


  private
  def calculation_age
    @applicant = Applicant.find(params[:id])
    date_format = "%Y%m%d"
    birthday = @applicant.birth_date.to_date
    @age = (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end
end
