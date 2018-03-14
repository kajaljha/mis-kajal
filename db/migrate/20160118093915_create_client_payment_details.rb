class CreateClientPaymentDetails < ActiveRecord::Migration
  def change
    create_table :client_payment_details do |t|

      t.integer :user_id 
      t.string :payment_mode
      t.float :payment_amount
      t.datetime :payment_date
      t.timestamps null: false
    end
  end
end
