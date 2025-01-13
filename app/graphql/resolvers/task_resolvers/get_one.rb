module Resolvers
  module TaskResolvers
    class GetOne < Resolvers::BaseResolver
      description "Gets one board"

      type Types::TaskTypes::TaskType, null: false

      argument :id, ID, required: false, description: "Task ID"

      def resolve(id: nil)
        raise "You have to be logged in" unless context[:current_user]

        Task.find_by(id: id)

        rescue ActiveRecord::RecordNotFound => e
          GraphQL::ExecutionError.new("Task not found")
      end
    end
  end
end
