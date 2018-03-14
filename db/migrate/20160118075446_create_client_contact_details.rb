class CreateClientContactDetails < ActiveRecord::Migration
  def change
    create_table :client_contact_details do |t|
      t.integer :user_id 
      t.string :skype_id
      t.string :personal_email_id
      t.string :official_email_id
      t.bigint :phone_no
    
      t.timestamps null: false
    end
  end
end
