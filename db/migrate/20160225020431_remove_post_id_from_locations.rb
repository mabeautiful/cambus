class RemovePostIdFromLocations < ActiveRecord::Migration
  def change
  	remove_column :locations, :posts_id
  end
end
