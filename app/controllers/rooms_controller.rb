class RoomsController < ApplicationController

  def index
    #@users = @room.includes(:user)
  end


  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, user_id:[])
  end
end
