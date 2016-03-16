class RenameCategoryIdInPosts < ActiveRecord::Migration
  def change
  	rename_column :posts, :category_id, :property_type_id
  end
end
