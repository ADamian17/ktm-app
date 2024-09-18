class CreateColumns < ActiveRecord::Migration[7.2]
  def change
    create_table :columns do |t|
      t.string :name
      t.references :board, null: false, foreign_key: true, default: nil
      t.timestamps
    end
  end
end
