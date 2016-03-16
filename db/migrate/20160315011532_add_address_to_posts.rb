class AddAddressToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :area, :string
  	add_column :posts, :address, :string
  end
end
