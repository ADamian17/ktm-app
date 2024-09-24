module Mutations
  module SubtaskMutations
    class Create < Mutations::BaseMutation
      graphql_name "CreateSubtask"
      description "Create a new subtask"

      input_object_class Types::SubtaskTypes::SubtaskCreateInputType

      type Types::SubtaskTypes::SubtaskType

      def resolve(title: nil, task_id: nil)
        return nil unless context[:current_user]

        task = Task.find_by(id: task_id)

        return GraphQL::ExecutionError.new("Task not found") unless task

        Subtask.create!(
          title: title,
          task: task
        )

      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
