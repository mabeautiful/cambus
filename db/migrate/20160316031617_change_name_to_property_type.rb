class ChangeNameToPropertyType < ActiveRecord::Migration
  def change
  	rename_column :property_types, :name, :property_name
  end
end
