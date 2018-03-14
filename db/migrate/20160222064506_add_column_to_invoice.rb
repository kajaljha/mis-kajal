class AddColumnToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :client_project_detail_id, :integer 
   
  end
end
