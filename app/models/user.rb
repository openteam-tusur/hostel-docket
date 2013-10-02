class User < ActiveRecord::Base
  sso_auth_user

  has_many :permissions
  has_many :records

  scope :with_permissions, proc { |role| joins(:permissions).where(:permissions => { :role => role }).uniq }

  searchable do
    text :to_s
    text :email
    string :to_s
  end

  def to_s
    [].tap do |s|
      s << last_name
      s << first_name
      s << JSON.parse(raw_info)['user']['middle_name']
    end.join(' ')
  end

  def hostel_ids
    permissions.map(&:context_id)
  end

  def as_json(options = {})
    super(:only => [:id]).merge({ :label => "#{to_s} <#{email}>", :value => email })
  end

  def sso_auth_name
    [].tap do |s|
      s << last_name
      s << first_name[0]+'.'
      s << patronymic[0]+'.' if patronymic.present?
      s << "<#{email}>"
    end.join(' ')
  end

  def patronymic
    parsed_raw_info.try(:[], 'user').try(:[], 'middle_name')
  end

  def parsed_raw_info
    JSON.parse(raw_info)
  end
end

# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  uid                :string(255)
#  name               :text
#  email              :text
#  nickname           :text
#  first_name         :text
#  last_name          :text
#  raw_info           :text
#  sign_in_count      :integer
#  current_sign_in_at :datetime
#  last_sign_in_at    :datetime
#  current_sign_in_ip :string(255)
#  last_sign_in_ip    :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

