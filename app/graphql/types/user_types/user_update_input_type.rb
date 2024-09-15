# frozen_string_literal: true

module Types
  module UserTypes
    class UserUpdateInputType < Types::BaseInputObject
      description "Attributes for updating an user"

      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :email, String, required: true
    end
  end
end
