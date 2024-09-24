# frozen_string_literal: true

module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver
    def resolve
      require_authentication
      super
    end

    private
    def require_authentication
      raise GraphQL::ExecutionError.new("You must be logged in!") unless context[:current_user]
    end
  end
end
