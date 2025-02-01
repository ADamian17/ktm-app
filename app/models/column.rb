class Column < ApplicationRecord
  belongs_to :board
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks, allow_destroy: true, reject_if: :all_blank

  validates :name, presence: true

  def initialize(attributes = {})
    super
    red = rand(128..255)
    green = rand(128..255)
    blue = rand(128..255)

    self.column_color = "rgb(#{red}, #{green}, #{blue})"
  end
end
