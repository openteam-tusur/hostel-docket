class Room < ActiveRecord::Base
  attr_accessible :number
  belongs_to :hostel
  has_many :roomers, :dependent => :destroy
  normalize_attributes :number
end
