class AddAmentityIdsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :amentity_ids, :string, array: true, default: []
  end
end
