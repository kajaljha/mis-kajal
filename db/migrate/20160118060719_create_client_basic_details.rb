class CreateClientBasicDetails < ActiveRecord::Migration
  def change
    create_table :client_basic_details do |t|
      
      t.integer :user_id 
      t.string :name
      t.text :location
  
      t.timestamps null: false
    end
  end
end
