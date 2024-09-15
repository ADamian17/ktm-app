module GraphQLHelpers
  def execute_graphql(query, variables: {}, context: {}, operation_name: nil)
    KtmAppSchema.execute(
      query,
      variables: variables,
      context: context,
      operation_name: operation_name
    )
  end
end

RSpec.configure do |config|
  config.include GraphQLHelpers, type: :request
end
