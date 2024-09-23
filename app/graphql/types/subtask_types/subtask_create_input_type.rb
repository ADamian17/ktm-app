# frozen_string_literal: true

module Types
  module SubtaskTypes
    class SubtaskCreateInputType < Types::BaseInputObject
      description "Attributes for creating a new subtask"

      argument :task_id, ID, required: true, description: "The ID of the task to which the subtask belongs"
      argument :title, String, required: true, description: "The title of the subtask"
    end
  end
end
