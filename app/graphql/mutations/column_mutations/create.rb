module Mutations
  module ColumnMutations
    class Create < BaseMutation
      graphql_name "CreateColumn"
      description "Create a new column"

      input_object_class Types::ColumnTypes::ColumnCreateInputType

      type Types::ColumnTypes::ColumnType

      def resolve(name: nil, board_id: nil)
        return nil unless context[:current_user]

        Column.create!(
          name: name,
          board_id: board_id
        )

      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
