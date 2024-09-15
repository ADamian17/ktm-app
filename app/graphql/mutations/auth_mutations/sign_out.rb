module Mutations
  class AuthMutations::SignOut < GraphQL::Schema::Mutation
    description "Sign out a user"

    field :success, Boolean, null: false

    def resolve
      return { success: false } unless context[:current_user]

      context[:current_user] = nil

      { success: true }
    end
  end
end
