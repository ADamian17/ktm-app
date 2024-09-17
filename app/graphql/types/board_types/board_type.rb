# frozen_string_literal: true

module Types
  module BoardTypes
    class BoardType < Types::BaseObject
      field :id, ID, null: false
      field :name, String
      field :uri, String
      field :user_id, Integer
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
