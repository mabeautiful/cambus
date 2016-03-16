class ChangeNameToPropertyType < ActiveRecord::Migration
  def change
  	change_column :property_types, :name, :property_name
  end
end
