class Search
  include ActiveAttr::Model
  attribute :hostel_ids
  attribute :record_notes
  attribute :record_points
  attribute :start_at, :type => Date
  attribute :end_at,   :type => Date

  attr_reader :date_range, :end_at, :hostel_ids, :record_notes, :record_points, :start_at

  %w(hostel_ids record_points).each do |method_name|
    define_method "#{method_name}=" do |value=nil|
      instance_variable_set("@#{method_name}", value && value.reject(&:blank?).any? ? value.map(&:to_i) : nil)
    end
  end

  %w(start_at end_at).each do |method_name|
    define_method "#{method_name}=" do |value=nil|
      instance_variable_set("@#{method_name}", value && value.present? ? Date.parse(value) : nil)
    end
  end

  def record_notes=(value)
    @record_notes = (value && value.reject!(&:blank?).any? ? value.map(&:to_s) : nil)
  end

  def date_range
    start_at && end_at ? (start_at..end_at) : nil
  end
end
