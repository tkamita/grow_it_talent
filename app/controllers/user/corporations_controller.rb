class User::CorporationsController < ApplicationController
  before_action :authenticate_applicant!

  def show
    @corporation = Corporation.find(params[:id])
  end

  
end
