class CreateBoards < ActiveRecord::Migration[7.2]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :uri
      t.references :user, foreign_key: true, default: nil
      t.timestamps
    end
  end
end
