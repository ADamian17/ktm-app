module Mutations
  module UserMutations
    class Update < BaseMutation
      graphql_name "UpdateUser"
      description "Update an user"

      input_object_class Types::UserTypes::UserUpdateInputType

      type Types::UserTypes::UserType

      def resolve(first_name: nil, last_name: nil, email: nil, password: nil)
        return nil unless context[:current_user]

        user = User.find(context[:current_user].id)

        return GraphQL::ExecutionError.new("User not found") unless user

        user.update!(
          email: email,
          first_name: first_name,
          last_name: last_name,
        )

        user

      rescue ActiveRecord::RecordNotFound => e
        GraphQL::ExecutionError.new(e.message)
      end
    end
  end
end
