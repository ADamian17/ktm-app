class Task < ApplicationRecord
  belongs_to :column
  has_many :subtasks, dependent: :destroy
  accepts_nested_attributes_for :subtasks, allow_destroy: true, reject_if: :all_blank

  validates :title, presence: true
  validates :description, presence: true, on: :update
  validates :status, presence: true, on: :update

  before_validation :set_status_based_on_column
  before_save :downcase_status

  private

  def set_status_based_on_column
    self.status = column.name if column.present? && status.blank?
  end

  def downcase_status
    self.status = status.downcase
  end
end
