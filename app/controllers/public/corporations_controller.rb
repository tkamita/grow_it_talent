class Public::CorporationsController < ApplicationController
  before_action :authenticate_corporation!
  before_action :ensure_corporation
  
  def show
  end

  def edit
  end

  def update
    if @corporation.update(corporation_params)
      redirect_to public_corporations_path
    else
      render :edit
    end
  end

  def edit_job
  end

  def update_job
    if @corporation.update(corporation_params)
      redirect_to public_corporations_path
    else
      render :edit_job
    end
  end
  
  private
  def corporation_params
    params.require(:corporation).permit(:name, :president_name, :establish_day, :quantity_emp, :capital_stock, :title,
                                        :location, :content, :is_stock, :business_description, :place_info, :require_competence,
                                        :work_location, :is_emp_status, :salary, :working_hour, :is_overtime, :is_overtime_pay,
                                        :commute_allowance, :day_off, :paid_vacation, :is_health_insurance, :is_welfare_pension,
                                        :is_emp_insurance, :is_accident_insurance, :is_dwelling, :is_retire_payment, :other_welfare,
                                        :recruit_number, :interview_number, :company_url, tag_ids: [])
  end

  def ensure_corporation
    @corporation = current_corporation
  end
end
