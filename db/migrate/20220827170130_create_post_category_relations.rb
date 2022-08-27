class CreatePostCategoryRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :post_category_relations do |t|
      t.references :post
      t.references :category
    end
  end
end
