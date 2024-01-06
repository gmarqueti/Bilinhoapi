class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :cpf
      t.date :birthday
      t.integer :phone
      t.string :gender
      t.string :method_type

      t.timestamps
    end
  end
end
