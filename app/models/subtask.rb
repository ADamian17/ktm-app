class Subtask < ApplicationRecord
  belongs_to :task

  validates :title, presence: true, length: { minimum: 3 }
  validates :completed, inclusion: { in: [ true, false ] }
end
