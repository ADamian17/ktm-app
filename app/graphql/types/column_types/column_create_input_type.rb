# frozen_string_literal: true

module Types
  module ColumnTypes
    class ColumnCreateInputType < Types::BaseInputObject
      description "Attributes for creating a new column"

      argument :name, String, required: true, description: "The name of the column"
      argument :board_id, ID, required: true, description: "The ID of the board to which the column belongs"
    end
  end
end
