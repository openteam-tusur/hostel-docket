class UsersController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  actions :index
  respond_to :json
end
