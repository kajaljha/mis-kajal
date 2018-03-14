class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.integer :invoice_id
      t.string :item
      t.text :description
      t.integer :unit_cost
      t.integer :quantity
      t.integer :price

      t.timestamps null: false
    end
  end
end
