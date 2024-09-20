module Mutations
  module ColumnMutations
    class Destroy < BaseMutation
      graphql_name "DeleteColumn"
      description "Delete an column"

      field :success, Boolean, null: false

      argument :id, ID, required: true, description: "ID of the column to delete"

      def resolve(id: nil)
        return { success: false } unless context[:current_user]

        column = Column.find(id)

        return GraphQL::ExecutionError.new("Column not found") unless column

        column.destroy

        { success: true }
      end
    end
  end
end
