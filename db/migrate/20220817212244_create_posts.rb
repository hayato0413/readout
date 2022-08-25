class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string    :title,                     null: false, default: "", limit: 40
      t.string    :content,                   null: false, default: "", limit: 150
      t.string    :author,                    null: false, default: "", limit: 20
      t.string    :publish,                   null: false, default: "", limit: 20
      t.integer   :evaluation,                null: false, default: 1, limit: 5
      t.timestamps
    end
  end
end
