class User::ApplicantsController < ApplicationController
  
  def show
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
