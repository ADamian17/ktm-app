# frozen_string_literal: true

module Types
  module SubtaskTypes
    class SubtaskInputType < Types::BaseInputObject
      description "Attributes for creating a new subtask"

      argument :completed, Boolean, required: false, description: "The completion status of the subtask"
      argument :id, ID, required: false, description: "The ID of the subtask to update"
      argument :title, String, required: true, description: "The title of the subtask"
      argument :_destroy, Boolean, required: false, description: "Mark the subtask for deletion"
    end
  end
end
