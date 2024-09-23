class AddDefaultValueToSubtask < ActiveRecord::Migration[7.2]
  def change
    change_column :subtasks, :completed, :boolean, default: false
  end
end
