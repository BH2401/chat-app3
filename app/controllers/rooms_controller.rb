class RoomsController < ApplicationController
  before_action :set_room, only: [:edit, :update, :destroy]

  def index
    #@users = @room.includes(:user)
    #@rooms = Room.all
  end


  def new
    redirect_to root_path if current_user.admin != 'kk22'
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

  def edit
    redirect_to root_path if current_user.admin != 'kk22'
  end

  def update
    if @room.update(room_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids:[])  #user_id:[]
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
