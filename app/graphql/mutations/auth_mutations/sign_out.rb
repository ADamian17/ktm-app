module Mutations
  module AuthMutations
    class SignOut < GraphQL::Schema::Mutation
      description "Sign out a user"

      field :success, Boolean, null: false

      def resolve
        return { success: false } unless context[:current_user]

        user = context[:current_user]
        user.update(refresh_token: nil, expires_at: nil)

        { success: true }
      end
    end
  end
end
