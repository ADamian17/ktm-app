# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [ Types::NodeType, null: true ], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ ID ], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # root-level fields here.
    field :current_user, resolver: Resolvers::UserResolvers::CurrentUser
    field :get_all_boards, resolver: Resolvers::BoardResolvers::GetAll
    field :get_one_board, resolver: Resolvers::BoardResolvers::GetOne
    field :get_one_task, resolver: Resolvers::TaskResolvers::GetOne
  end
end
