class User::ApplicantsController < ApplicationController
  
  def show
    date_format = "%Y%m%d"
    birthday = current_applicant.birth_date.to_date
    @age = (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end

  def edit
    @applicant = current_applicant
    date_format = "%Y%m%d"
    birthday = current_applicant.birth_date.to_date
    @age = (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end

  def update
    @applicant = current_applicant
		if @applicant.update(applicant_params)
			redirect_to user_applicants_path, notice: 'successfully updated'
		else
			render action: :edit
    end
  end

  def work
    date_format = "%Y%m%d"
    birthday = current_applicant.birth_date.to_date
    @age = (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end

  def edit_work
    @applicant = current_applicant
    date_format = "%Y%m%d"
    birthday = current_applicant.birth_date.to_date
    @age = (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end

  def update_work
    @applicant = current_applicant
		if @applicant.update(applicant_params)
			redirect_to user_work_history_path, notice: 'successfully updated'
		else
			render action: :edit_work
    end
  end

  private
  def applicant_params
    params.require(:applicant).permit(:email, :last_name, :first_name, :last_furigana, :first_furigana, :gender, :birth_date, :image, :postal_code,
                                      :prefecture, :manicipal, :address_other, :phone_number, :school_division, :school_name, :faculty, :academic_decipline,
                                      :english_skill, :other_lang, :overview_w_history, :is_selection, :start_work, :work_location, :axis,
                                      :company_type, :pg_skill, :self_pr, :vision, :term_1, :term_2, :term_3, :term_4, :term_5, :work_history_1,
                                      :work_history_2, :work_history_3, :work_history_4, :work_history_5, :prefecture_kana)
  end
end
