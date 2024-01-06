class CreateBillings < ActiveRecord::Migration[6.1]
  def change
    create_table :billings do |t|
      t.float :total_value
      t.integer :installments
      t.integer :due_day
      t.string :course_name
      t.integer :institution_id
      t.integer :student_id

      t.timestamps
    end
  end
end
