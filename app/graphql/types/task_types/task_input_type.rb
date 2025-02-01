# frozen_string_literal: true

module Types
  module TaskTypes
    class TaskInputType < Types::BaseInputObject
      description "Attributes new task"

      argument :id, ID, required: false, description: "The id of the task to update"
      argument :title, String, required: true, description: "The title of the task"
      argument :_destroy, Boolean, required: false, description: "Task mark for deletion"
    end
  end
end
