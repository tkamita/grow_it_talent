class User::QualificationsController < ApplicationController

  def index
    @qualifications = current_applicant.qualifications
    @qualification = Qualification.new
  end
  
  def create
    @qualification = Qualification.new(qualification_params)
    if @qualification.save
      redirect_to user_qualifications_path
    else
      @qualifications = current_applicant.qualifications
      render :index
    end
  end

  def update
    @qualification = Qualification.find(params[:id])
    if @qualification.update(qualification_params)
      redirect_to user_qualifications_path
    else
      @qualifications = current_applicant.qualifications
      @qualification = Qualification.new
      render :index
    end
  end

  def destroy
    @qualification = Qualification.find(params[:id])
    @qualification.destroy
    redirect_to user_qualifications_path
  end
  
  private
  def qualification_params
    params.require(:qualification).permit(:applicant_id, :name, :acquition_date)
  end
end
