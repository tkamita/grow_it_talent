module UserNoticesHelper
  def unchecked_user_notices
    @user_notices = UserNotice.where(is_check: true)
  end
end
