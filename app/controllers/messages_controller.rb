class MessagesController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    @message = Message.new(message_params)
    @message.room_id = @room
    @message.save
    redirect_to room_path(@message.room_id)
  end
  
  private
  def message_params
    params.require(:message).permit(:content)
  end
end