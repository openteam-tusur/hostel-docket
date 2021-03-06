class Point < ActiveRecord::Base
  extend Enumerize
  attr_accessible :description, :initiator, :mark, :note, :number

  serialize :note, Array
  enumerize :note,
            :multiple => true,
            :in => [
              :confiscation,
              :deprivation,
              :eviction,
              :note_of_warning,
              :recovery,
              :work,
              :faculty_reproof,
              :faculty_rebuke,
              :university_rebuke,
              :sending_down
            ]

  serialize :initiator, Array
  enumerize :initiator,
            :multiple => true,
            :in => [
              :monitor,
              :brotherhood,
              :orderly,
              :sanitary_committee
            ]

  validates_format_of :number, :with => /\A\d+(\.\d+)*\z/

  normalize_attributes :description, :mark, :note, :number
  alias_attribute :to_s, :full_description

  searchable do
    text :full_description
    string :number
  end

  def full_description
    "#{number} #{description}"
  end

  def to_label
    "#{number} <span title='#{description}'></span>".html_safe
  end

  def as_json(options)
    super(:only => [:id]).merge({ :label => full_description, :value => full_description })
  end
end
