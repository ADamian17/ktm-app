module Resolvers
  module UserResolvers
    class CurrentUser < Resolvers::BaseResolver
      description "Get user by ID"

      type Types::UserTypes::UserType, null: true

      def resolve
        return nil unless context[:current_user]

        User.find(context[:current_user].id)

      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new("User with ID #{id} not found")
      end
    end
  end
end
