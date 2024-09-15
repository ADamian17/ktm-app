class User < ApplicationRecord
  before_save {
    self.email = email.downcase
  }
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :role, presence: true, inclusion: { in: %w[admin user], message: "%{value} is not a valid role" }
end
