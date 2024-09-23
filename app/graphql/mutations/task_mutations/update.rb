module Mutations
  module TaskMutations
    class Update < BaseMutation
      graphql_name "UpdateTask"
      description "Update an task"

      input_object_class Types::TaskTypes::TaskUpdateInputType

      type Types::TaskTypes::TaskType

      def resolve(id: nil, **args)
        return nil unless context[:current_user]

        task = Task.find_by(id: id)

        return GraphQL::ExecutionError.new("Task not found") unless task

        task.update!(args)

        task
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
