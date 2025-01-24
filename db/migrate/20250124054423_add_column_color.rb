class AddColumnColor < ActiveRecord::Migration[7.2]
  def change
    add_column :columns, :column_color, :string, default: "#FFFFFF"
  end
end
