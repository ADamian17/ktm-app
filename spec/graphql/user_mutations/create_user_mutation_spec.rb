require 'rails_helper'

RSpec.describe 'GraphQL CreateUser Mutation', type: :request do
  it 'creates a new user' do
    mutation = <<~GRAPHQL
      mutation CreateUser($email: String!, $password: String!, $firstName: String!, $lastName: String!) {
        createUser(
          input: {email: $email, password: $password, firstName: $firstName, lastName: $lastName}
        ) {
          id
          lastName
          firstName
          role
        }
      }
    GRAPHQL

    variables = {
      firstName: "John",
      lastName: "Doe",
      email: "john@example.com",
      password: "password123"
    }

    result = execute_graphql(mutation, variables: variables)
    user_data = result['data']['createUser']

    expect(user_data['firstName']).to eq("John")
    expect(User.find(user_data['id']).email).to eq("john@example.com")
  end
end
