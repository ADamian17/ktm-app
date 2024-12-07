module Mutations
  module BoardsMutations
    class Create < BaseMutation
      graphql_name "CreateBoard"
      description "Create a new board"

      input_object_class Types::BoardTypes::BoardCreateInputType

      type Types::BoardTypes::BoardType

      def resolve(name: nil, columns_attributes: nil)
        return nil unless context[:current_user]

        columns = columns_attributes&.map(&:to_h) || []

        Board.create!(
          name: name,
          user: context[:current_user],
          columns_attributes: columns
        )

      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new(e.record.errors.full_messages.join(", "))
      end
    end
  end
end
