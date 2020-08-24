class User::AppliesController < ApplicationController
  before_action :authenticate_applicant!

  def create
    @apply = current_applicant.applies.create(corporation_id: params[:corporation_id])
    @apply.create_corpo_notice_apply(@apply.corporation.id, @apply.id, @apply.applicant.id)
    redirect_to user_corporation_path(@apply.corporation_id)
  end

end
