module Resolvers
  class UserResolvers::CurrentUser < Resolvers::BaseResolver
    description "Get user by ID"

    null true

    type Types::UserTypes::UserType, null: true

    def resolve
      return nil unless context[:current_user]

      User.find(context[:current_user].id)

    rescue ActiveRecord::RecordNotFound => e
      GraphQL::ExecutionError.new(e.message)
    end
  end
end
