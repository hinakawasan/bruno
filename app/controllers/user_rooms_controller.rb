class UserRoomsController < ApplicationController
  
  def create(user_id,room_id)
    @user_room = UserRoom.build(user_id, room_id)
    @user_room.save
  end
end
