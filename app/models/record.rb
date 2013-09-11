class Record < ActiveRecord::Base
  belongs_to :roomer
  attr_accessible :point_initiator, :point_mark, :memo, :point_note, :point_number, :point_description, :hostel, :room
  validates_format_of :number, :with => /\A\d+(\.\d+)*\z/
  before_create :set_info

private
  def set_info
    self.hostel = roomer.room.hostel
    self.room   = roomer.room
  end
end
