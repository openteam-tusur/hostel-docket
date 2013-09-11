class RecordsController < ApplicationController
  inherit_resources
  belongs_to :hostel, :room, :roomer
  actions :all, :except => [:index, :show]
end
