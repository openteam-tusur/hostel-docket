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

  scope :by_number, ->(a) { order('number ASC') }

  validates_format_of :number, :with => /\A\d+(\.\d+)*\z/
end
