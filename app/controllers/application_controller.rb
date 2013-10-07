class ApplicationController < ActionController::Base
  protect_from_forgery
  authorize_resource :class => false, :only => [:search, :my_stats]

  def index
    redirect_to my_stats_path if current_user && current_user.owner?
  end

  def search
    roomers = Roomer.search do
      fulltext params[:q] if params[:q].present?
      with(:active, true)
      with(:hostel_id, current_user.hostel_ids) if current_user.manager? || current_user.reader?
      order_by(:full_name)
    end.results

    rooms = Room.search do
      with(:number, params[:q]) if params[:q].present?
      with(:hostel_id, current_user.hostel_ids) if current_user.manager? || current_user.reader?
      order_by(:number)
    end.results

    @results = Kaminari.paginate_array(roomers + rooms).page(params[:page]).per(20)
  end

  def my_stats
    @permissions = current_user.permissions.with_role(:owner)
  end

  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      redirect_to root_url, :alert => t('cancan.access_denied')
    else
      redirect_to new_user_session_url, :alert => t('cancan.access_denied')
    end
  end
end
