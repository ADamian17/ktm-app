module Mutations
  module SubtaskMutations
    class CompleteSubtask < Mutations::BaseMutation
      graphql_name "completeSubtask"
      description "Sets subtask to completed"

      argument :id, ID, required: true, description: "Subtask ID"
      argument :completed, Boolean, required: true, description: "Subtask completed status"

      field :success, Boolean, null: false

      def resolve(id: nil, completed: nil)
        return nil unless context[:current_user]

        subtask = Subtask.find_by(id: id)

        return GraphQL::ExecutionError.new("Subtask not found") unless subtask

        subtask.update(completed: completed)

        { success: subtask.completed }

      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
