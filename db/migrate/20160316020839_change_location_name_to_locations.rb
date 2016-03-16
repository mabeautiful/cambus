class ChangeLocationNameToLocations < ActiveRecord::Migration
  def change
  	rename_column :locations, :location_name, :name
  end
end
