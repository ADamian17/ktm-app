class Column < ApplicationRecord
  belongs_to :board
  has_many :tasks, dependent: :destroy

  validates :name, presence: true

  def initialize(attributes = {})
    super
    red = rand(128..255)
    green = rand(128..255)
    blue = rand(128..255)

    self.column_color = "rgb(#{red}, #{green}, #{blue})"
  end
end
