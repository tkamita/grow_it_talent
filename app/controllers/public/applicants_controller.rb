class Public::ApplicantsController < ApplicationController
  


  def index
    @applicants = Applicant.all.order(created_at: :desc)
  end
  
  def show
    @applicant = Applicant.find(params[:id])
    date_format = "%Y%m%d"
    birthday = @applicant.birth_date.to_date
    @age = (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end


  def work
    @applicant = Applicant.find(params[:id])
    date_format = "%Y%m%d"
    birthday = @applicant.birth_date.to_date
    @age = (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end


  private
end
