require 'rails_helper'

RSpec.describe "Column Model", type: :model do
  before do
    @user = User.new(first_name: "Test", last_name: "User", email: "test.user@example.com", password: "password")
    @user.save
  end

  it 'should not be valid without a name' do
    column = Column.new(board: Board.new(user: @user))
    expect(column).not_to be_valid
  end

  it 'should belong to a board' do
    board = Board.new(name: "Test Board", user: @user)
    column = Column.new(name: "Test Column", board: board)
    expect(column.board).to eq(board)
  end
end
