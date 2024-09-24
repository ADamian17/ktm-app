# frozen_string_literal: true

module Types
  module TaskTypes
    class TaskType < Types::BaseObject
      field :id, ID, null: false
      field :title, String
      field :description, String
      field :status, String
      field :column_id, Integer
      field :subtasks, Types::SubtaskTypes::SubtaskType.connection_type, null: false
      field :completed_subtasks, Integer, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
