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

  has_many :boards, dependent: :destroy

  def generate_tokens
    access_token = JsonWebToken.encode({ user_id: id })
    refresh_token = SecureRandom.hex(32)
    update(refresh_token: refresh_token, expires_at: 7.days.from_now)

    { access_token: access_token, refresh_token: refresh_token }
  end
end
