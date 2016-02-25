class RenameColumnsPosts < ActiveRecord::Migration
  def change
  	rename_column :posts, :category, :category_id
  	change_column :posts, :category_id, :integer
  	rename_column :posts, :location, :location_id
  	change_column :posts, :location_id, :integer
  end
end
