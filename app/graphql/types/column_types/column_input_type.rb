# frozen_string_literal: true

module Types
  module ColumnTypes
    class ColumnInputType < Types::BaseInputObject
      description "Attributes for creating a new column"

      argument :id, ID, required: false, description: "The ID of the column"
      argument :name, String, required: false, description: "The name of the column"
      argument :column_color, String, required: false, description: "The column color"
      argument :_destroy, Boolean, required: false, description: "Mark the column for destruction"
    end
  end
end
