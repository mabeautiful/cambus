class RemoveColumnsFromPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :category, :string
  	remove_column :posts, :location, :string
  end
end
