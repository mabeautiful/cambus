class AddOtherColumnsToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :category_id, :integer
  	add_column :posts, :location_id, :integer
  end
end
