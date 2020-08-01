class User::CorporationsController < ApplicationController

  def show
    @corporation = Corporation.find(params[:id])
  end

  
end
