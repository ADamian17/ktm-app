module Mutations
  module TaskMutations
    class Update < BaseMutation
      graphql_name "UpdateTask"
      description "Update an task"

      input_object_class Types::TaskTypes::TaskUpdateInputType

      type Types::TaskTypes::TaskType

      def resolve(id: nil, column_id: nil, subtasks_attributes: nil, **args)
        return nil unless context[:current_user]

        task = Task.find_by(id: id)

        return GraphQL::ExecutionError.new("Task not found") unless task

        column = Column.find_by(id: column_id)

        return GraphQL::ExecutionError.new("Column not found") unless column

        subtasks = subtasks_attributes&.map(&:to_h) || []

        params = {
          title: args[:title],
          description: args[:description],
          column: column,
          subtasks_attributes: subtasks
        }

        task.update!(params)

        task
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
