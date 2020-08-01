class Public::HomesController < ApplicationController
  def top
    @applicants = Applicant.all.order(created_at: :desc).limit(5)
    date_format = "%Y%m%d"
    @applicants.each do |a|
      @birthday = a.birth_date.to_date
    end
    @age = (Date.today.strftime(date_format).to_i - @birthday.strftime(date_format).to_i) / 10000
    @rooms = current_corporation.rooms
  end
end
