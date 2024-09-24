module Mutations
  module SubtaskMutations
    class Destroy < Mutations::BaseMutation
      graphql_name "DestroySubtask"
      description "Destroy a subtask"

      field :success, Boolean, null: false

      argument :id, ID, required: true, description: "The ID of the subtask to destroy"

      def resolve(id: nil)
        return { success: false } unless context[:current_user]

        subtask = Subtask.find(id)

        return GraphQL::ExecutionError.new("Subtask not found") unless subtask

        subtask.destroy

        { success: true }
      end
    end
  end
end
