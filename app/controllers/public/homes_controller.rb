class Public::HomesController < ApplicationController
  before_action :authenticate_corporation!
  
  def top
    @applicants = Applicant.all.order(created_at: :desc).limit(5)
    date_format = "%Y%m%d"
    @applicants.each do |a|
      @birthday = a.birth_date.to_date
    end
    age = (Date.today.strftime(date_format).to_i - @birthday.strftime(date_format).to_i) / 10000
    @rooms = current_corporation.rooms
    @search_params = applicant_search_params
  end

  def search
    unless applicant_search_params[:search_min_age] == ""
      younger_birth_ymd = calc_younger_birthday(applicant_search_params[:search_min_age]).to_s
    else
      younger_birth_ymd = calc_younger_birthday("0").to_s
    end
    unless applicant_search_params[:search_max_age] == ""
      older_birth_ymd = calc_older_birthday(applicant_search_params[:search_max_age]).to_s
    else
      older_birth_ymd = calc_older_birthday("150").to_s
    end
    younger_birthday = Time.parse(younger_birth_ymd)
    older_birthday = Time.parse(older_birth_ymd)
    @search_params = applicant_search_params
    @applicants = Applicant.search(@search_params).where(birth_date: older_birthday..younger_birthday)
    date_format = "%Y%m%d"
    @applicants.each do |a|
      @birthday = a.birth_date.to_date
    end
    if @applicants.present?
      @age = (Date.today.strftime(date_format).to_i - @birthday.strftime(date_format).to_i) / 10000
    end
  end


  private
  def applicant_search_params
    params.fetch(:search, {}).permit(:gender, :birthday_from, :birthday_to, :school_division,
                                     :work_location, :axis, :company_type, :search_min_age, :search_max_age)
  end
  def calc_younger_birthday(age)
    Date.today.strftime("%Y%m%d").to_i - age.to_i * 10000
  end
  def calc_older_birthday(age)
    Date.today.strftime("%Y%m%d").to_i - age.to_i * 10000 - 9999
  end
  
end