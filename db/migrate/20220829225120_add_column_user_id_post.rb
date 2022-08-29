class AddColumnUserIdPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :user_id, :int, null: false
  end
end
