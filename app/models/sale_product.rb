# frozen_string_literal: true

class SaleProduct < ApplicationRecord
  belongs_to :sale
  belongs_to :product

  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true, minimum: 1 }

  validate :validate_product_availability

  private

  def validate_product_availability
    if quantity > available_quantity
      errors.add(:quantity, "is greater than the available quantity")
    end
  end

  def available_quantity
    Storage.where(store_id: sale.store_id, product_id: product_id).sum(:quantity)
  end


  after_save :set_total_amount

  def set_total_amount
    total = 0
    sale_products.each do |sale_product|
      total += sale_product.quantity * sale_product.product.unit_price.to_f
    end
    sale.update(total_amount: total)
  end
end
