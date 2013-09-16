class HostelsController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  actions :index, :show

  def collection
    if current_user.manager?
      super.select{|h| current_user.hostel_ids.include?(h.id)}
    else
      super
    end
  end
end
