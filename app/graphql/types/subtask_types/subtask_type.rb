# frozen_string_literal: true

module Types
  module SubtaskTypes
    class SubtaskType < Types::BaseObject
      field :id, ID, null: false
      field :title, String
      field :completed, Boolean
      field :task_id, Integer, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
