class CreateProjectDetails < ActiveRecord::Migration
  def change
    create_table :project_details do |t|
      t.string  :project_name
      t.string  :your_role
      t.string  :project_url
      t.datetime  :project_duration
      t.text :project_desc
      t.string :technical_stack
      t.string :client_name
      t.string :comp_name
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
