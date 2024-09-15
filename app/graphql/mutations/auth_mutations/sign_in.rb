module Mutations
  module AuthMutations
    class SignIn < BaseMutation
      description "Sign in a user"

      null true

      argument :email, String, required: true
      argument :password, String, required: true

      field :token, String, null: true
      field :user, Types::UserTypes::UserType, null: true

      def resolve(email:, password:)
        user = User.find_by(email: email)

        return nil unless user

        if user&.authenticate(password)
           token = JsonWebToken.encode(user_id: user.id)
          { user: user, token: token }
        else
          GraphQL::ExecutionError.new("Invalid email or password")
        end
      end
    end
  end
end
