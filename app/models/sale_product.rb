# frozen_string_literal: true

class SaleProduct < ApplicationRecord
  belongs_to :sale
  belongs_to :product

  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true, minimum: 1 }


  scope :for_product_and_store, ->(product_id, store_id) { 
    where(product_id: product_id, sale_id: Sale.where(store_id: store_id).pluck(:id))
  }

  validate :validate_quantity_for_sale_product

  private

  def validate_quantity_for_sale_product
    if quantity > available_quantity
      errors.add(:quantity, "is greater than the available quantity")
    end
  end

  def available_quantity
    Storage.for_product_and_store(product_id, sale.store_id).sum(:quantity)
  end

end
