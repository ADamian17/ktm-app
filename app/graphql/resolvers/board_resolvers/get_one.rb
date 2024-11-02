module Resolvers
  module BoardResolvers
    class GetOne < Resolvers::BaseResolver
      description "Gets one board"

      type Types::BoardTypes::BoardType, null: false

      argument :id, ID, required: false, description: "Board ID"
      argument :uri, String, required: false, description: "Board URI"

      def resolve(id: nil, uri: nil)
        raise "You have to be logged in" unless context[:current_user]

        Board.find_by(uri: uri) || Board.find_by(id: id)

        rescue ActiveRecord::RecordNotFound => e
          GraphQL::ExecutionError.new("Board not found")
      end
    end
  end
end
