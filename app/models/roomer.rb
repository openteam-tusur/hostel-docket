class Roomer < ActiveRecord::Base
  attr_accessible :name, :patronymic, :surname
  belongs_to :room
  has_one :hostel, :through => :room
  has_many :records, :dependent => :destroy, :order => 'created_at DESC'
  normalize_attributes :name, :patronymic, :surname
  alias_attribute :to_s, :full_name

  searchable do
    text :surname
    text :name
    text :patronymic
    string :full_name
  end

  def full_name
    [surname, name, patronymic].join(' ')
  end

  def current_rating
    records.by_current_year.sum(:mark)
  end
end