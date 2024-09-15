# frozen_string_literal: true

module Types
  module UserTypes
    class RoleType < Types::BaseEnum
      description "User role enum"
      value "ADMIN", "Admin role", value: "admin"
      value "USER", "User role", value: "user"
    end
  end
end
