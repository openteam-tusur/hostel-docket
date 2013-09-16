class HostelsController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  actions :index, :show

  def collection
    if current_user.administrator?
      super
    else
      super.select{|h| current_user.hostel_ids.include?(h.id)}
    end
  end
end
