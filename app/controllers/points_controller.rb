class PointsController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  actions :all, :except => [:show]
  custom_actions :collection => :search

  def search
    search! do
      @results = Point.search do
        fulltext params[:term]
        order_by(:number)
      end.results
      render :json => @results and return
    end
  end
end
