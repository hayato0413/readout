class AddColumnsUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false, default: '', limit: 30
    add_column :users, :profile, :string, limit: 120
  end
end
