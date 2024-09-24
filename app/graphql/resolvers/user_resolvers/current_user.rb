module Resolvers
  module UserResolvers
    class CurrentUser < Resolvers::BaseResolver
      description "Get user by ID"

      null true

      type Types::UserTypes::UserType, null: true

      def resolve
        User.find(context[:current_user].id)

      rescue ActiveRecord::RecordNotFound => e
        GraphQL::ExecutionError.new(e.message)
      end
    end
  end
end
