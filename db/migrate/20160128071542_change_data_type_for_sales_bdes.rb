class ChangeDataTypeForSalesBdes < ActiveRecord::Migration
  def self.up
    change_table :sales_bdes do |t|
      t.change :skype_id , :string
    end
  end
  def self.down
    change_table :sales_bdes do |t|
      t.change :skype_id , :integer
    end
  end
end

