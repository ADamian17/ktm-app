module Mutations
  module UserMutations
    class Create < BaseMutation
      graphql_name "CreateUser"
      description "Create a new user"

      input_object_class Types::UserTypes::UserCreateInputType

      type Types::UserTypes::UserType

      def resolve(first_name: nil, last_name: nil, email: nil, password: nil)
        User.create!(
          email: email,
          first_name: first_name,
          last_name: last_name,
          password: password,
        )

      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
