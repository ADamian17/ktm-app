class Board < ApplicationRecord
  belongs_to :user
  has_many :columns, dependent: :destroy

  validates :name, presence: true, format: {
    with: /\A[a-zA-Z\s]+\z/, message: "only letters and spaces allowed"
  }

  validates :uri,  presence: true, uniqueness: true, format: {
    with: /\A\/[a-z-]+\/\z/, message: "must start with a '/' and contain only lowercase letters, hyphens, and end with a '/'"
  }

  def initialize(attributes = {})
    super
    self.uri = uri.present? ? uri : "/#{name.downcase.gsub(/\s+/, "-")}/" if name.present?
  end
end
