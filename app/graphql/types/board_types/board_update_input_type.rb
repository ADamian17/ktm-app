# frozen_string_literal: true

module Types
  module BoardTypes
    class BoardUpdateInputType < Types::BaseInputObject
      description "Attributes for updating a board"

      argument :id, ID, required: true, description: "ID of the board to update"
      argument :name, String, required: false, description: "The name of the board"
      argument :uri, String, required: false, description: "The URI of the board"
    end
  end
end
