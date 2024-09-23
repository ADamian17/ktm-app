class Task < ApplicationRecord
  before_save {
    self.status = status.downcase
  }

  belongs_to :column
  has_many :subtasks, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true
end
