class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user).order("created_at DESC")  #チャットルームに紐付いている全てのメッセージ（@room.messages）を@messagesと定義します。
    #これを改変して@users = @room.includes(:user)
    #チャットルームに紐付いている全てのメッセージ（@room.messages）を@messagesと定義します。
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end



  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
