module Mutations
  module TaskMutations
    class Destroy < BaseMutation
      graphql_name "DeleteTask"
      description "Delete an task"

      field :success, Boolean, null: false

      argument :id, ID, required: true, description: "ID of the task to delete"

      def resolve(id: nil)
        return { success: false } unless context[:current_user]

        task = Task.find(id)

        return GraphQL::ExecutionError.new("Task not found") unless task

        task.destroy

        { success: true }
      end
    end
  end
end
