# encoding: utf-8

class Permission < ActiveRecord::Base
  extend Enumerize

  belongs_to :user
  belongs_to :context, :polymorphic => true

  attr_accessible :role, :context_id, :user_id

  validates_presence_of :user_id, :role

  validates_presence_of :context_id, :context_type, :if => :role_manager?

  validates_uniqueness_of :context_id, scope: :user_id

  before_validation :set_context_type
  before_validation :reset_context, :if => :role_administrator?

  scope :by_user, ->(a) { joins(:user).order('users.last_name ASC, users.first_name ASC') }

  enumerize :role,
    :in => [:administrator, :manager],
    :default => :manager,
    :predicates => { :prefix => true },
    :scope => true

  sso_auth_permission :roles => %w[administrator manager]

private
  def set_context_type
    self.context_type = 'Hostel'
  end

  def reset_context
    self.context_id = self.context_type = nil
  end
end

# == Schema Information
#
# Table name: permissions
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  context_id   :integer
#  context_type :string(255)
#  role         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

