class User < ApplicationRecord
  rolify



  after_create :assign_default_role

  def assign_default_role
    if User.count == 1
      self.add_role(:admin) if self.roles.blank?
      self.add_role(:teacher)
      self.add_role(:student)
    else
      self.add_role(:student) if self.roles.blank?
      self.add_role(:teacher) #if you want any user to be able to create own courses
    end
  end

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable

  has_many :courses, dependent: :destroy

  def to_s
    email
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[
      id
      email
      sign_in_count
      current_sign_in_at
      last_sign_in_at
      current_sign_in_ip
      last_sign_in_ip
      confirmed_at
      created_at
      updated_at
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[courses]
  end

  def username
    self.email.split(/@/).first
  end





# Only addmin can edit roll

  validate :must_have_a_role, on: :update

  private
  def must_have_a_role
    unless roles.any?
      errors.add(:roles, "must have at least one role")
    end
  end


end
