# frozen_string_literal: true

class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.references :client, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.string :fiscal_number, null: false, limit: 20
      t.decimal :total_amount, null: false, precision: 10, scale: 2, default: 0
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
