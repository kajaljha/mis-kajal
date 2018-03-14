class CreateSalesConsultants < ActiveRecord::Migration
  def change
    create_table :sales_consultants do |t|
      t.integer :user_id 
      t.string :name
      t.float :commission
      t.bigint :contact
      t.string :skype_id
      t.string :email_id
      t.string :location
      t.text :address
      t.integer :bank_account_no
      t.string :bank_name
      t.string :branch_name
      t.string :ifsc_code
      
      t.timestamps null: false
    end
   def self.down
    remove_column :bank_account_no
   end

  def self.up
    add_column :bank_account_no, :bigint
   end 
 end
end
