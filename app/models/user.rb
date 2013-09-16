class User < ActiveRecord::Base
  sso_auth_user

  has_many :permissions

  scope :with_permissions, proc { |role| joins(:permissions).where(:permissions => { :role => role }).uniq }

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

