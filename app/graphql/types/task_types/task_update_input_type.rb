# frozen_string_literal: true

module Types
  module TaskTypes
    class TaskCreateInputType < Types::BaseInputObject
      description "Attributes for creating a update task"

      argument :id, ID, required: true, description: "The ID of the task"
      argument :description, String, required: false, description: "The description of the task"
      argument :title, String, required: false, description: "The title of the task"
    end
  end
end
