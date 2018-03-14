class CreateBdes < ActiveRecord::Migration
  def change
    create_table :bdes do |t|
      t.integer :user_id 
      t.string :sales_id
      t.integer :skype_id 
      
      t.timestamps null: false
    end
  end
end
