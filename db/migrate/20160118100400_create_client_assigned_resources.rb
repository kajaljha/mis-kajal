class CreateClientAssignedResources < ActiveRecord::Migration
  def change
    create_table :client_assigned_resources do |t|
      t.integer :user_id 
      t.string :company_name
      t.string :location
      t.string :designation
   
      t.timestamps null: false
    end
  end
end
