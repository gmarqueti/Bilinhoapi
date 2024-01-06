class CreateInstitutions < ActiveRecord::Migration[6.1]
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :cnpj
      t.string :kind

      t.timestamps
    end
  end
end
