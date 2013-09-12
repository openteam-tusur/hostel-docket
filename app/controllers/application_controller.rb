class ApplicationController < ActionController::Base
  protect_from_forgery

  def search
    @results = Roomer.search{ fulltext params[:q]; with(:active, true); order_by(:full_name)}.results + Room.search { with(:number, params[:q]); order_by(:number)}.results
  end
end
