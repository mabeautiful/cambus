class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :phone
    	t.string :email
    	t.text :address
    	t.integer :user_id
    end
  end
end
