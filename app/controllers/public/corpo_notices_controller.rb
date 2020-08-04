class Public::CorpoNoticesController < ApplicationController
  def index
    @corpo_notices = current_corporation.corpo_notices
    @corpo_notices.where(is_check: false).each do |cn|
      cn.update_attributes(is_check: true)
    end
  end

  def destroy
    @corpo_notices =current_corporation.corpo_notices.destroy_all
    redirect_to public_corpo_notices_path
  end
end
