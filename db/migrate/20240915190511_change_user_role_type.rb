class ChangeUserRoleType < ActiveRecord::Migration[7.2]
  def change
    change_column :users, :role, :string, default: "admin"
  end
end
