# frozen_string_literal: true

class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.references :address, null: false, foreign_key: true
      t.string :name, null: false, limit: 255
      t.string :CNPJ, null: false, limit: 20

      t.timestamps
    end
  end
end
