# frozen_string_literal: true

module Types
  module ColumnTypes
    class ColumnUpdateInputType < Types::BaseInputObject
      description "Attributes for creating a new column"

      argument :id, ID, required: true, description: "ID of the column to update"
      argument :name, String, required: false, description: "The name of the column"
      argument :tasks_attributes, [ Types::TaskTypes::TaskInputType ], required: false, description: "The tasks of the column"
    end
  end
end
