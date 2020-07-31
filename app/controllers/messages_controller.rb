class MessagesController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    @message = Message.new(message_params)
    if corporation_signed_in?
      @message.is_corporation = true
      @message.create_notification_message(@room.corporation.id, @message.id, @room.id, @room.applicant.id)
    else
      @message.is_corporation = false
      @message.create_corpo_notice_message(@room.corporation.id, @message.id, @room.id, @room.applicant.id)
    end
    @message.room_id = @room.id
    @message.save
    redirect_to room_path(@room)
  end
  
  private
  def message_params
    params.require(:message).permit(:content)
  end
end