class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.references :address, null: false, foreign_key: true
      t.string :name, null: false, limit: 255
      t.string :CPF, null: false, limit: 15

      t.timestamps
    end
  end
end
