class Roomer < ActiveRecord::Base
  attr_accessible :name, :patronymic, :surname, :room_id
  belongs_to :room
  has_one :hostel, :through => :room
  has_many :records, :dependent => :destroy, :order => 'created_at DESC'
  normalize_attributes :name, :patronymic, :surname
  alias_attribute :to_s, :full_name
  scope :active, -> { where(:deleted_at => nil) }

  searchable do
    text :surname
    text :name
    text :patronymic
    string :full_name
    boolean :active
  end

  def active
    deleted_at == nil
  end

  def full_name
    [surname, name, patronymic].join(' ')
  end

  def current_rating
    records.by_current_year.sum(:mark)
  end

  def current_notes
    records.by_current_year.map{|r| [r.note.map(&:text).join(', '), r.created_at] if r.note.any? }.compact
  end
end
