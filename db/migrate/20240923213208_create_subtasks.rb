class CreateSubtasks < ActiveRecord::Migration[7.2]
  def change
    create_table :subtasks do |t|
      t.string :title
      t.boolean :completed
      t.references :task, null: false, foreign_key: true, default: nil
      t.timestamps
    end
  end
end
