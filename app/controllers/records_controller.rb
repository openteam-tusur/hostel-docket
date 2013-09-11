class RecordsController < ApplicationController
  inherit_resources
  belongs_to :hostel, :room, :roomer
  actions :all, :except => [:index, :show]
  before_filter :find_point, :only => :new

private
  def find_point
    @point = Point.find(params[:point_id])
  end
end
