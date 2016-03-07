class AddEnabledToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :enabled, :boolean
  end
end
