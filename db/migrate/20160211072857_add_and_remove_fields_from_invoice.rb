class AddAndRemoveFieldsFromInvoice < ActiveRecord::Migration
  def change
  	remove_column :invoices, :payment_terms
  	remove_column :invoices, :subject
  	remove_column :invoices, :tax
  	add_column :invoices, :status, :boolean, :default => false
  	add_column :invoices, :tax, :integer
  	add_column :invoices, :discount, :integer
  end
end
