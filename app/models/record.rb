class Record < ActiveRecord::Base
  acts_as_paranoid
  extend Enumerize
  has_paper_trail

  belongs_to :roomer
  belongs_to :point
  belongs_to :user
  attr_accessible :initiator, :mark, :memo, :note, :number, :description, :document_number, :point_id
  validates_format_of :number, :with => /\A\d+(\.\d+)*\z/
  before_create :set_info
  after_save :roomer_reindex
  after_destroy :roomer_reindex

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

  scope :by_current_year, -> { where(:created_at => year_dates[:begin_of_year]..year_dates[:end_of_year]) }

  normalize_attributes :document_number

  def full_description
    "#{number} #{description}"
  end

  def author
    User.find_by_id(originator)
  end

  def self.year_dates
    today = Time.zone.today
    dates = {}
    if today.month >= 1 && today.month < 8
      dates[:begin_of_year] = Time.zone.parse("#{today.year-1}-09-01")
      dates[:end_of_year]   = Time.zone.parse("#{today.year}-08-31")
    else
      dates[:begin_of_year] = Time.zone.parse("#{today.year}-09-01")
      dates[:end_of_year]   = Time.zone.parse("#{today.year+1}-08-31")
    end
    dates
  end

private
  def set_info
    self.hostel = roomer.room.hostel.title
    self.room   = roomer.room.to_s
  end

  def roomer_reindex
    roomer.index
  end
end
