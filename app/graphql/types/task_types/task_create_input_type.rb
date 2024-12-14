# frozen_string_literal: true

module Types
  module TaskTypes
    class TaskCreateInputType < Types::BaseInputObject
      description "Attributes for creating a new task"

      argument :column_id, ID, required: true, description: "The ID of the column to which the task belongs"
      argument :description, String, required: true, description: "The description of the task"
      argument :title, String, required: true, description: "The title of the task"
      argument :subtasks_attributes, [ Types::SubtaskTypes::SubtaskInputType ], required: false, description: "The subtasks of the task"
    end
  end
end
