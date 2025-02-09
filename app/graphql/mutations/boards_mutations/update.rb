module Mutations
  module BoardsMutations
    class Update < BaseMutation
      graphql_name "UpdateBoard"
      description "Update an existing board"

      input_object_class Types::BoardTypes::BoardUpdateInputType

      type Types::BoardTypes::BoardType

      def resolve(id: nil, **args)
        return nil unless context[:current_user]

        board = Board.find_by(id: id)

        return GraphQL::ExecutionError.new("Board not found") unless board

        columns = args[:columns_attributes]&.map { |column| column.to_h.except(:column_color) } || []
        params = {
          name: args[:name],
          columns_attributes: columns
        }

        board.update!(params)

        board
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
