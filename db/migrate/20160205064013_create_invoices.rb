class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :user_id
      t.date :invoice_date
      t.string :invoice_number
      t.string :bill_to
      t.string :currency
      t.string :tax
      t.date :due_date
      t.string :payment_terms
      t.string :subject
      t.text :note

      t.timestamps null: false
    end
  end
end
