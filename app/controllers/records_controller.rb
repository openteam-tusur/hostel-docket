class RecordsController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  belongs_to :hostel, :room, :roomer
  actions :all, :except => [:index, :show]
  custom_actions :resource => :restore
  before_filter :find_point, :only => :new

  def restore
    restore! {
      @record.update_attributes(:deleted_at => nil)
      redirect_to parent_path and return
    }
  end

private
  def find_point
    @point = Point.find(params[:point_id])
  end

protected
  def resource
    return @record ||= end_of_association_chain.scoped.tap{|o| o.default_scoped=false}.only_deleted.find(params[:id]) if action_name == 'restore'
    super
  end
end
