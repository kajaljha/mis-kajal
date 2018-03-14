class ChangeDataTypeForBankandidentitydetails < ActiveRecord::Migration
  def self.up
    change_table :bank_and_identity_details do |t|
    t.change :ifsc_code , :string
    end
  end
  def self.down
    change_table :bank_and_identity_details do |t|
    t.change :ifsc_code, :bigint
    end
  end
end



