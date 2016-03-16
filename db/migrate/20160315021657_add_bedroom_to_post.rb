class AddBedroomToPost < ActiveRecord::Migration
  def change
    add_column :posts, :bedroom, :integer
    add_column :posts, :bathroom, :integer
    add_column :posts, :floor, :integer
    add_column :posts, :size, :string
  end
end
