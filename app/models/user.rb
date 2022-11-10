class User < ApplicationRecord
  has_secure_password

  def password_matches_password_confirmation
    if password != password_confirmation
      errors.add(:password, "must match password_confirmation field")
    end
    :password == :password_confirmation
  end

  def self.authenticate_with_credentials(email,password)
    user_email = email.strip.downcase
    user = User.find_by_email(user_email)
    
    if user.authenticate(password)
      user
    else
      nil
    end
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validate :password_matches_password_confirmation
  validates :email, uniqueness: true
  validates :password, length: {minimum: 4}


end
