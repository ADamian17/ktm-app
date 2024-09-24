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

    # Board mutations
    field :create_board, mutation: Mutations::BoardsMutations::Create
    field :delete_board, mutation: Mutations::BoardsMutations::Destroy
    field :update_board, mutation: Mutations::BoardsMutations::Update

    # Column mutations
    field :create_column, mutation: Mutations::ColumnMutations::Create
    field :delete_column, mutation: Mutations::ColumnMutations::Destroy
    field :update_column, mutation: Mutations::ColumnMutations::Update

    # Task mutations
    field :create_task, mutation: Mutations::TaskMutations::Create
    field :delete_task, mutation: Mutations::TaskMutations::Destroy
    field :update_task, mutation: Mutations::TaskMutations::Update

    # Subtask mutations
    field :create_subtask, mutation: Mutations::SubtaskMutations::Create
    field :delete_subtask, mutation: Mutations::SubtaskMutations::Destroy
  end
end
