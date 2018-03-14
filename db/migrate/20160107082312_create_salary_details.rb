class CreateSalaryDetails < ActiveRecord::Migration
  def change
    create_table :salary_details do |t|
      t.string  :user_type
      t.float  :ctc
      t.float  :training_salary
      t.float  :probation_salary
      t.float :confirmed_salary
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
