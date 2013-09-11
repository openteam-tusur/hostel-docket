class Room < ActiveRecord::Base
  attr_accessible :number
  belongs_to :hostel
  has_many :roomers, :dependent => :destroy
  normalize_attributes :number
  alias_attribute :to_s, :title

  searchable do
    string :number
  end

  def title
    "Комната #{number}"
  end
end
