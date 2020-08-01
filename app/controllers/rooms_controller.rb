class RoomsController < ApplicationController

  def index
    if corporation_signed_in?
      @rooms = current_corporation.rooms
    else
      @rooms = current_applicant.rooms
    end
  end
  
  def show
    # if corporation_signed_in?
      # @room = Room.find_by(applicant_id: params[:applicant_id], corporation_id: current_corporation.id)
      @room = Room.find(params[:id])
    # else
      # @room = Room.find_by(corporation_id: params[:corporation_id], applicant_id: current_applicant.id)
      # end
      @message = Message.new
      # byebug
      # if @room.messages.present?
      @messages = @room.messages
    # end
  end
  
  def create
    # @room = Room.new(room_params)
    @room = Room.new(applicant_id: params[:applicant_id], corporation_id: params[:corporation_id])
    # if applicant_signed_in?
    #   @room.applicant_id = current_applicant
    # elsif corporation_signed_in?
    # @room.corporation_id = current_corporation.id
    # end
    @room.save
    redirect_to room_path(@room)
  end

  private
  def room_params
    params.require(:room).permit(:applicant_id, :corporation_id)
  end
end