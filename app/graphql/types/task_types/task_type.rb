# frozen_string_literal: true

module Types
  module TaskTypes
    class TaskType < Types::BaseObject
      field :id, ID, null: false
      field :title, String
      field :description, String
      field :status, String
      field :column_id, Integer
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end