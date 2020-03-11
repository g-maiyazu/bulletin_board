class CreatePostCategoryRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :post_category_relations do |t|
      t.integer :post_id
      t.integer :category_id

      t.timestamps
    end
    add_index :post_category_relations, :post_id
    add_index :post_category_relations, :category_id
    add_index :post_category_relations, [:post_id, :category_id], unique: true
  end
end
