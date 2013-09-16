class UsersController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  actions :index

  def index
    index! do
      @results = User.search do
        fulltext params[:term]
        order_by(:to_s)
      end.results
      render :json => @results and return
    end
  end
end
