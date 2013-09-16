class Point < ActiveRecord::Base
  extend Enumerize
  attr_accessible :description, :initiator, :mark, :note, :number

  serialize :note, Array
  enumerize :note,
            :multiple => true,
            :in => [
              :eviction,
              :note_of_warning,
              :sending_down,
              :recovery,
              :deprivation,
              :confiscation,
              :work
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

  searchable do
    text :full_description
    string :number
  end

  def full_description
    "#{number} #{description}"
  end

  def as_json(options)
    super(:only => [:id]).merge({ :label => full_description, :name => full_description })
  end
end
