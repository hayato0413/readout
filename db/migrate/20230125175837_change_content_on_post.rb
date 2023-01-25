class ChangeContentOnPost < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :content, :string, null: false, default: "", limit: 500
  end
end
