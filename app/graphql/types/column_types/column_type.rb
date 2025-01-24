# frozen_string_literal: true

module Types
  module ColumnTypes
    class ColumnType < Types::BaseObject
      field :id, ID, null: false
      field :name, String
      field :board_id, Integer, null: false
      field :column_color, String, null: false
      field :tasks, Types::TaskTypes::TaskType.connection_type, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
