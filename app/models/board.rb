class Board < ApplicationRecord
  before_validation {
    self.name = name.downcase
  }

  belongs_to :user
  has_many :columns, dependent: :destroy
  accepts_nested_attributes_for :columns, allow_destroy: true, reject_if: :all_blank

  validates :name, presence: true, uniqueness: true, format: {
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
