class Hostel < ActiveRecord::Base
  attr_accessible :address, :title, :contingent_id
  has_many :rooms, :dependent => :destroy
  normalize_attributes :address, :title, :contingent_id
end
