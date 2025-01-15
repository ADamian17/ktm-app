class Task < ApplicationRecord
  before_save {
    self.status = status.downcase
  }

  belongs_to :column
  has_many :subtasks, dependent: :destroy
  accepts_nested_attributes_for :subtasks, allow_destroy: true, reject_if: :all_blank

  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true
end
