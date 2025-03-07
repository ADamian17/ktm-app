module Resolvers
  module BoardResolvers
    class GetAll < Resolvers::BaseResolver
      description "Get all boards"

      type Types::BoardTypes::BoardType.connection_type, null: false

      def resolve
        raise "You have to be logged in" unless context[:current_user]

        Board.where(user_id: context[:current_user].id)
      end
    end
  end
end
