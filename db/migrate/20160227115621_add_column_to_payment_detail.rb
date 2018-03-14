class AddColumnToPaymentDetail < ActiveRecord::Migration
   def change
  	add_column :client_payment_details, :sales_id, :integer
  end
end
