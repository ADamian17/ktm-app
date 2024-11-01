require 'rails_helper'

RSpec.describe "Subtask model", type: :model do
  before do
    column = Column.new(name: "Test Board")
    column.save
    @task = Task.new(title: "Test Task", description: "Test Description", status: "open", column: @column)
    @task.save
  end

  it "is valid with valid attributes" do
    subtask = Subtask.new(title: "Test Subtask", completed: false, task: @task)
    expect(subtask).to be_valid
  end

  it "is not valid without a name" do
    subtask = Subtask.new(title: nil, completed: false)
    expect(subtask).to_not be_valid
  end

  it "is not valid without a completed status" do
    subtask = Subtask.new(title: "Test Subtask", completed: nil)
    expect(subtask).to_not be_valid
  end
end
