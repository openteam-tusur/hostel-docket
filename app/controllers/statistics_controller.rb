class StatisticsController < ApplicationController
  def search
    authorize! :manage, :statistics
    search_options = params[:search]
    @search_object = Search.new(search_options)

    @results = Roomer.search do |s|
      s.with(:active, true)
      s.with(:has_records, true)

      if params[:search]
        s.with(:hostel_id, @search_object.hostel_ids)                if @search_object.hostel_ids
        s.with(:record_date).between(@search_object.date_range)      if @search_object.date_range
        s.with(:record_points).any_of(@search_object.record_points)  if @search_object.record_points
        s.with(:record_notes).any_of(@search_object.record_notes)    if @search_object.record_notes
      end

      s.order_by(:current_rating)
      s.order_by(:full_name)
      s.paginate :page => params[:page], :per_page => 20
    end.results
  end
end
