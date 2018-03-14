class ChangeDataTypeForClientproject < ActiveRecord::Migration
  def self.up
    change_table :client_project_details do |t|
      t.change :currency_type, :text
    end
  end
  def self.down
    change_table :client_project_details do |t|
      t.change :currency_type, :string
    end
  end
end





