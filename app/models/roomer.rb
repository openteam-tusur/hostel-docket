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
    boolean :has_records
    integer (:hostel_id) { hostel.id }
    integer (:current_rating)

    date :record_date, :multiple => true do
      records.map(&:created_at)
    end

    string :record_notes, :multiple => true do
      records.map{|r| r.note.map(&:value)}.flatten.uniq
    end

    integer :record_points, :multiple => true do
      records.map{ |r| r.try(:point_id) }.compact
    end
  end

  def active
    deleted_at == nil
  end

  def has_records
    records.any?
  end

  def full_name
    [surname, name, patronymic].join(' ')
  end

  def current_rating
    records.by_current_year.sum(:mark)
  end

  def current_rating_to_s
    "#{current_rating} балл."
  end

  def current_notes
    records.by_current_year.map{|r| [r.note.map(&:text).join(', '), r.created_at] if r.note.any? }.compact
  end

  def current_notes_count
    records.by_current_year.map{|r| r.note.map(&:value)}.flatten.count
  end
end
