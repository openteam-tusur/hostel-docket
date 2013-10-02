# encoding: utf-8

class Permission < ActiveRecord::Base
  attr_accessible :role, :context_id, :user_id, :email

  extend Enumerize

  belongs_to :user
  belongs_to :context, :polymorphic => true

  validates_presence_of :email, :role
  validates_presence_of :context_id, :context_type, :if => :manager_or_reader?

  validates_uniqueness_of :context_id, :scope => :email
  validates_email_format_of :email, :message => 'Неверный формат электронной почты'

  def self.validates_presence_of(*attr_names)
    new_attrs = []
    option = {}
    attr_names.each do |attr|
      if attr.class == Hash

        next
      end
      new_attrs << attr if attr != :user
    end
    super new_attrs, option
  end

  before_validation :set_context_type
  before_validation :reset_context, :if => :role_administrator?

  scope :by_user, ->(a) { order('email') }

  normalize_attribute :email do |value|
    value.present? ? value.downcase : value
  end

  enumerize :role,
    :in => [:administrator, :manager, :reader],
    :default => :manager,
    :predicates => { :prefix => true },
    :scope => true

  sso_auth_permission :roles => %w[administrator manager reader]

  def self.activate_for_user(user)
    where(:email => user.email).update_all :user_id => user.id
  end

  def manager_or_reader?
    role_manager? || role_reader?
  end

  def to_s
    ''.tap do |s|
      s << "&lt;#{user.email}&gt; #{user} &mdash; " if user.present?
      s << "&lt;#{email}&gt; роль не активирована &mdash; " if user.nil?
      s << role_text
      s << " &laquo;#{context}&raquo;" if role_manager?
    end.html_safe
  end

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

