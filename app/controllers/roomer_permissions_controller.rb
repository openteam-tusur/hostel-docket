class RoomerPermissionsController < ApplicationController
  inherit_resources
  defaults :singleton => true, :resource_class => Permission
  load_and_authorize_resource :class => Permission

  belongs_to :roomer, :room, :hostel

  actions :all, :except => [:index, :show, :edit, :update]

protected
  def build_resource
    obj = super
    obj.role = :owner
    obj
  end

  def parent_url
    hostel_room_roomer_path(@hostel, @room, @roomer)
  end
end
