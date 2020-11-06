class RoomsController < ApplicationController

  def create
    @room = Room.new
    @room.save
  end
end
