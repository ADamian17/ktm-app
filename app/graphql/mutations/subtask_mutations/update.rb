module Mutations
  module SubtaskMutations
    class Update < BaseMutation
      graphql_name "UpdateSubtask"
      description "Update an subtask"

      input_object_class Types::SubtaskTypes::SubtaskUpdateInputType

      type Types::SubtaskTypes::SubtaskType

      def resolve(id: nil, **args)
        return GraphQL::ExecutionError, "You must be logged in!" unless context[:current_user]

        subtask = Subtask.find_by(id: id)

        return GraphQL::ExecutionError.new("Subtask not found") unless subtask

        subtask.update!(args)

        subtask
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
