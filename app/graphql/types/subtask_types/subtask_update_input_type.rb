# frozen_string_literal: true

module Types
  module SubtaskTypes
    class SubtaskUpdateInputType < Types::BaseInputObject
      description "Attributes for updating a subtask"

      argument :id, ID, required: true, description: "The ID of the subtask to update"
      argument :title, String, required: false, description: "The title of the subtask"
      argument :completed, Boolean, required: false, description: "The completion status of the subtask"
    end
  end
end
