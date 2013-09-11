class PointsController < ApplicationController
  inherit_resources
  actions :all, :except => [:show]
  has_scope :by_number, :default => 1
end
