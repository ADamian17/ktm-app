# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # Auth mutations
    field :sign_in_user, mutation: Mutations::AuthMutations::SignIn
    # User mutations
    field :create_user, mutation: Mutations::UserMutations::Create
  end
end
