class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
        t.integer :user_id
	    t.boolean :availability 
	    t.string :currently_working_on
	    t.string :sales_email_id
	    t.string :leave_type
	    t.date :leave_from_date
	    t.date :leave_to_date
	    t.text :reason
	    t.boolean :status, :default => false
	    t.text :comment

        t.timestamps null: false
    end
  end
end
