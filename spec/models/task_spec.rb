require 'rails_helper'

RSpec.describe "Task Model", type: :model do
  before do
    @column = Column.new(name: "Test Board")
    @column.save
  end

  it "is valid with valid attributes" do
    task = Task.new(title: "Test Task", description: "Test Description", status: "open", column: @column)
    expect(task).to be_valid
  end

  it "is not valid without a title" do
    task = Task.new(title: nil, description: "Test Description", status: "open")
    expect(task).to_not be_valid
  end

  it "is not valid without a description" do
    task = Task.new(title: "Test Task", description: nil, status: "open")
    expect(task).to_not be_valid
  end

  it "is not valid without a status" do
    task = Task.new(title: "Test Task", description: "Test Description", status: nil)
    expect(task).to_not be_valid
  end

  it "downcases the status before saving" do
    task = Task.new(title: "Test Task", description: "Test Description", column: @column)
    task.save
    expect(task.status).to eq("test board")
  end
end
