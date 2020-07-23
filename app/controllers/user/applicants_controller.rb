class User::ApplicantsController < ApplicationController
  
  def show
    date_format = "%Y%m%d"
    birthday = current_applicant.birth_date.to_date
    @age = (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end

  def edit
    @applicant = current_applicant
  end

  def update
    @applicant = current_applicant
		if @applicant.update(applicant_params)
			redirect_to user_applicants_path, notice: 'successfully updated'
		else
			render action: :edit
    end
  end

  private
  def applicant_params
    # permit後でいれる
    params.require(:applicant).permit(:hoge)
  end
end
