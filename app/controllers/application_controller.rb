class ApplicationController < ActionController::Base
  protect_from_forgery
  authorize_resource :class => false, :only => :search

  def index
  end

  def search
    roomers = Roomer.search do
      fulltext params[:q]
      with(:active, true)
      with(:hostel_id, current_user.hostel_ids) if current_user.manager?
      order_by(:full_name)
    end.results

    rooms = Room.search do
      with(:number, params[:q])
      with(:hostel_id, current_user.hostel_ids) if current_user.manager?
      order_by(:number)
    end.results

    @results = roomers + rooms
  end

  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      redirect_to root_url, :alert => t('cancan.access_denied')
    else
      redirect_to new_user_session_url, :alert => t('cancan.access_denied')
    end
  end
end
