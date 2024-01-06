class CreateBills < ActiveRecord::Migration[6.1]
  def change
    create_table :bills do |t|
      t.float :value
      t.date :due_date
      t.integer :billing_id
      t.string :status

      t.timestamps
    end
  end
end
