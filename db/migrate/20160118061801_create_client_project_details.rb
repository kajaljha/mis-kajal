class CreateClientProjectDetails < ActiveRecord::Migration
  def change
    create_table :client_project_details do |t|
      
      t.integer :user_id 
      t.string :project_name
      t.text :description
      t.string :technologies
      t.date :project_start_date
      t.date :estimated_end_date
      t.string :project_type
      t.text :currency_type
     

      t.timestamps null: false
    end
  end
end
