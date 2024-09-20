class Task < ApplicationRecord
  before_save {
    self.status = status.downcase
  }

  belongs_to :column

  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true
end
