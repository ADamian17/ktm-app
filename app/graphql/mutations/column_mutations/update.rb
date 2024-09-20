module Mutations
  module ColumnMutations
    class Update < BaseMutation
      graphql_name "UpdateColumn"
      description "Update an existing column"

      input_object_class Types::ColumnTypes::ColumnUpdateInputType

      type Types::ColumnTypes::ColumnType

      def resolve(id: nil, **args)
        return nil unless context[:current_user]

        column = Column.find_by(id: id)

        return GraphQL::ExecutionError.new("Column not found") unless column

        column.update!(args)

        column
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
