# frozen_string_literal: true

module Types
  module BoardTypes
    class BoardCreateInputType < Types::BaseInputObject
      description "Attributes for creating a board"

      argument :name, String, required: true, description: "The name of the board"
      argument :uri, String, required: false, description: "The URI of the board"
      argument :columns_attributes, [Types::ColumnTypes::ColumnInputType], required: false, description: "The columns of the board"
    end
  end
end
