# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # Auth mutations
    field :sign_in_user, mutation: Mutations::AuthMutations::SignIn
    field :sign_out_user, mutation: Mutations::AuthMutations::SignOut

    # User mutations
    field :create_user, mutation: Mutations::UserMutations::Create
    field :delete_user, mutation: Mutations::UserMutations::Destroy
    field :update_user, mutation: Mutations::UserMutations::Update
  end
end
