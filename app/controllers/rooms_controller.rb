class RoomsController < ApplicationController

  def index
    if corporation_signed_in?
      @rooms = current_corporation.rooms
    else
      @rooms = current_applicant.rooms
    end
  end
  
  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages
  end
  
  def create
    @room = Room.new(applicant_id: params[:applicant_id], corporation_id: params[:corporation_id])
    @room.save
    redirect_to room_path(@room)
  end

  private
  def room_params
    params.require(:room).permit(:applicant_id, :corporation_id)
  end
end