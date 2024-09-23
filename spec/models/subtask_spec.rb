require 'rails_helper'

RSpec.describe "Subtask model", type: :model do
  it "is valid with valid attributes" do
    subtask = Subtask.new(title: "Test Subtask", completed: false)
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
