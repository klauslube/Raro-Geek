class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false, limit: 255
      t.decimal :unit_price, null: false, precision: 8, scale: 2, default: 0
      t.text :description, null: false

      t.timestamps
    end
  end
end
