class AddColumnsToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :price, :float
  	add_column :posts, :category, :string
  end
end
