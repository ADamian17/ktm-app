module Mutations
  module TaskMutations
    class UpdateTaskStatus < BaseMutation
      # graphql_name is for naming the mutation in the schema and we don't get in conflict with the other mutations using the same name class name Create
      graphql_name "updateTaskStatus"
      description "Update task status"

      argument :id, ID, required: true, description: "Task ID"
      argument :column_id, ID, required: true, description: "Column ID"

      type Types::TaskTypes::TaskType

      def resolve(id: nil, column_id: nil)
        return nil unless context[:current_user]

        task = Task.find_by(id: id)

        return GraphQL::ExecutionError.new("Task not found") unless task

        column = Column.find_by(id: column_id)

        return GraphQL::ExecutionError.new("Column not found") unless column

        task.update!(column: column, status: column[:name])

        task
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
