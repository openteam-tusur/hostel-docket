class RoomsController < ApplicationController
  inherit_resources
  belongs_to :hostel
  actions :show
end
