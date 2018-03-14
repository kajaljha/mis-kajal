class CreatePreviousCompDetails < ActiveRecord::Migration
  def change
    create_table :previous_comp_details do |t|
      t.string  :company_name
      t.string  :location
      t.string  :designation 
      t.datetime :from_month_year
      t.datetime :to_month_year
      t.float :last_ctc
      t.string :leave_reason
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
