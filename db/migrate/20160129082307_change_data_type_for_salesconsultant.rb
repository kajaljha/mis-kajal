class ChangeDataTypeForSalesconsultant < ActiveRecord::Migration
   def self.up
    change_table :sales_consultants do |t|
     t.change :bank_account_no , :bigint
    end
  end
  def self.down
    change_table :sales_consultants do |t|
     t.change :bank_account_no , :integer
    end
  end
end