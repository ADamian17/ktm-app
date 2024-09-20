class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :status
      t.references :column, foreign_key: true, default: nil
      t.timestamps
    end
  end
end
