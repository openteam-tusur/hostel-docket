class RoomersController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  belongs_to :hostel, :room
  actions :show
end
