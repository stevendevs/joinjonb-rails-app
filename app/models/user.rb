class User < ApplicationRecord
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
end
