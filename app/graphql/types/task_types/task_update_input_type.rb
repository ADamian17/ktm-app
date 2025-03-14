# frozen_string_literal: true

module Types
  module TaskTypes
    class TaskUpdateInputType < Types::BaseInputObject
      description "Attributes for updating a update task"

      argument :id, ID, required: true, description: "The ID of the task"
      argument :description, String, required: false, description: "The description of the task"
      argument :title, String, required: false, description: "The title of the task"
      argument :column_id, ID, required: false, description: "The column ID of the task"
      argument :subtasks_attributes, [ Types::SubtaskTypes::SubtaskInputType ], required: false, description: "The subtasks of the task"
    end
  end
end
