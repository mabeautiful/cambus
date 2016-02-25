class AddColumnsToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :price, :double
  	add_column :posts, :category, :string
  end
end
