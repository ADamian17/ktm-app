module Mutations
  module BoardsMutations
    class Destroy < BaseMutation
      graphql_name "DeleteBoard"
      description "Delete an board"

      field :success, Boolean, null: false

      argument :id, ID, required: true, description: "ID of the board to delete"

      def resolve(id: nil)
        return { success: false } unless context[:current_user]

        board = Board.find(id)

        return GraphQL::ExecutionError.new("Board not found") unless board

        board.destroy

        { success: true }
      end
    end
  end
end
