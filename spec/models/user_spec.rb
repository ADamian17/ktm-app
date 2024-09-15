require 'rails_helper'

RSpec.describe "User Model", type: :model do
  it 'new user valid' do
    user = User.new(first_name: "Test", last_name: "User", email: "test.user@example.com", password: "password")
    expect(user).to be_valid
  end

  it 'new user not valid' do
    user = User.new(first_name: "Test", last_name: "User", password: "password")
    expect(user).not_to be_valid
  end
end
