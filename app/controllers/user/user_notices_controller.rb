class User::UserNoticesController < ApplicationController
  def index
    @user_notices = current_applicant.user_notices
    @user_notices.where(is_check: false).each do |un|
      un.update_attributes(is_check: true)
    end
  end
end
