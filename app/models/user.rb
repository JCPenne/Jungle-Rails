class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def password_matches_password_confirmation
    if password != password_confirmation
      errors.add(:password, "must match password_confirmation field")
    end
    :password == :password_confirmation
  end

  validate :password_matches_password_confirmation
  
  validates :email, uniqueness: true
end
