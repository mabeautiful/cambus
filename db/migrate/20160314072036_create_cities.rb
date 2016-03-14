class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
    	t.string :name
    end

    create_table :areas do |c|
    	c.string :name
    end
  end
end
