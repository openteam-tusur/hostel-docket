class Point < ActiveRecord::Base
  extend Enumerize
  attr_accessible :description, :initiator, :mark, :note

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
end
