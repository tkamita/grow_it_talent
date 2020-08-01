class User::AppliesController < ApplicationController

  def create
    @apply = current_applicant.applies.create(corporation_id: params[:corporation_id])
    @apply.create_corpo_notice_apply(@apply.corporation.id, @apply.id, @apply.applicant.id)
    redirect_to user_corporation_path(@apply.corporation_id)
  end

  # def destroy
  #   @apply = Apply.find_by(corporation_id: params[:corporation_id], applicant_id: current_applicant.id)
  #   @apply.destroy
  #   redirect_to user_corporation_path(@apply.corporation_id)
  # end
  
end
