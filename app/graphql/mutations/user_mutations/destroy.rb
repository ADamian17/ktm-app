module Mutations
  module UserMutations
    class Destroy < GraphQL::Schema::Mutation
      graphql_name "DeleteUser"
      description "Delete an user"

      field :success, Boolean, null: false

      def resolve
        return { success: false } unless context[:current_user]

        user = User.find(context[:current_user].id)

        return GraphQL::ExecutionError.new("User not found") unless user

        user.destroy

        { success: true }
      end
    end
  end
end
