class RoomsController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  belongs_to :hostel
  actions :show
end
