class RoomersController < ApplicationController
  inherit_resources
  belongs_to :hostel, :room
  actions :show
end
