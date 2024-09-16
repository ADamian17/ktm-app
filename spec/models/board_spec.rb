require 'rails_helper'

RSpec.describe "Board Model", type: :model do
  before do
    @user = User.new(first_name: "Test", last_name: "User", email: "test.user@example.com", password: "password")
    @user.save
  end

  it 'should not be valid with name containing symbols or numbers' do
    board = Board.new(name: "Test%Board@9834")
    expect(board).not_to be_valid
  end

  it 'should not be valid with uri /34@-Hello-WORLD' do
    board = Board.new(name: "hello", uri: "34@-Hello-WORLD")
    expect(board).not_to be_valid
  end

  it 'should not be valid without a name' do
    board = Board.new(user: @user)
    expect(board).not_to be_valid
  end

  it 'should create uri /test-hello-world/' do
    board = Board.new(name: "Test Hello World")
    expect(board.uri).to match("/test-hello-world/")
  end

  it 'should create uri /hello-world/' do
    board = Board.new(name: "Test Hello World", uri: "/hello-world/")
    expect(board.uri).to match("/hello-world/")
  end

  it 'should not allow duplicate uris' do
    Board.create(name: "Test Board", user: @user)
    duplicate_board = Board.new(name: "Test Board",  user: @user)
    expect(duplicate_board).not_to be_valid
  end

  it 'should belong to a user' do
    board = Board.new(name: "Test Board", uri: "/test-board/", user: @user)
    expect(board.user).to eq(@user)
  end

  it 'should generate uri based on name' do
    board = Board.new(name: "Another Test Board")
    expect(board.uri).to eq("/another-test-board/")
  end
end
