class Roomer < ActiveRecord::Base
  attr_accessible :name, :patronymic, :surname
  belongs_to :room
  normalize_attributes :name, :patronymic, :surname
end
