module Types
  module SubtaskTypes
    class SubtaskConnectionType < Types::BaseConnection
      field :completed_subtasks, Integer, null: false

      def completed_subtasks
        object.items.count(&:completed)
      end
    end
  end
end
