class Roomer < ActiveRecord::Base
  attr_accessible :name, :patronymic, :surname
  belongs_to :room
  normalize_attributes :name, :patronymic, :surname

  searchable do
    text :surname
    text :name
    text :patronymic
  end

  def full_name
    [surname, name, patronymic].join(' ')
  end
end
