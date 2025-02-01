module Mutations
  module ColumnMutations
    class Create < BaseMutation
      graphql_name "CreateColumn"
      description "Create a new column"

      input_object_class Types::ColumnTypes::ColumnCreateInputType

      type Types::ColumnTypes::ColumnType

      def resolve(name: nil, board_id: nil, tasks_attributes: nil)
        return nil unless context[:current_user]

        tasks = tasks_attributes&.map(&:to_h) || []

        Column.create!(
          name: name,
          board_id: board_id,
          tasks_attributes: tasks
        )

      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
