class CreateBankAndIdentityDetails < ActiveRecord::Migration
  def change
    create_table :bank_and_identity_details do |t|

      t.integer :user_id 
      t.bigint :bank_account_no
      t.string :bank_name
      t.string :branch_name
      t.string :city
      t.bigint :ifsc_code
      t.string :pancard_no
      t.string :passport_no
      t.string :uid_no
      t.timestamps null: false
    end
  def self.down
    remove_column :ifsc_code
   end

  def self.up
    add_column :ifsc_code, :string
   end 
 end
end