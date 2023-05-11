# frozen_string_literal: true

class ProductSupplier < ApplicationRecord
  belongs_to :product
  belongs_to :supplier

  scope :by_product_and_supplier, -> (product_id, supplier_id) { where(product_id: product_id, supplier_id: supplier_id) }
end
