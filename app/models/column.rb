class Column < ApplicationRecord
  belongs_to :board

  validates :name, presence: true
end
