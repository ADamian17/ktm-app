module Mutations
  module TaskMutations
    class Create < BaseMutation
      # graphql_name is for naming the mutation in the schema and we don't get in conflict with the other mutations using the same name class name Create
      graphql_name "CreateTask"
      description "Create a new task"

      input_object_class Types::TaskTypes::TaskCreateInputType

      type Types::TaskTypes::TaskType

      def resolve(title: nil, description: nil, column_id: nil)
        return nil unless context[:current_user]

        column = Column.find_by(id: column_id)

        return GraphQL::ExecutionError.new("Column not found") unless column

        Task.create!(
          title: title,
          description: description,
          column: column,
          status: column[:name]
        )

      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
