module Mutations
  module AuthMutations
    class SignIn < BaseMutation
      description "Sign in a user"

      null true

      argument :email, String, required: true
      argument :password, String, required: true

      field :access_token, String, null: true
      field :refresh_token, String, null: true
      field :user, Types::UserTypes::UserType, null: true

      def resolve(email:, password:)
        user = User.find_by(email: email)

        return nil unless user

        if user&.authenticate(password)
          tokens = user.generate_tokens

          {
            user: user,
            access_token: tokens[:access_token],
            refresh_token: tokens[:refresh_token]
          }
        else
          GraphQL::ExecutionError.new("Invalid email or password")
        end
      end
    end
  end
end
