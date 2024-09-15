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
  enum role: [ :admin, :user ]
end
