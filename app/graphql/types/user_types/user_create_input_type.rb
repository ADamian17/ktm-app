# frozen_string_literal: true

module Types
  class UserTypes::UserCreateInputType < Types::BaseInputObject
    description "Attributes for creating a user"

    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
  end
end
