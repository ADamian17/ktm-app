# frozen_string_literal: true

module Types
  class UserTypes::UserType < Types::BaseObject
    field :boards, Types::BoardTypes::BoardType.connection_type, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :email, String
    field :first_name, String
    field :id, ID, null: false
    field :last_name, String
    field :role, String, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
