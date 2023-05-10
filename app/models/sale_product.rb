# frozen_string_literal: true

class SaleProduct < ApplicationRecord
  belongs_to :sale
  belongs_to :product

  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true, minimum: 1 }

  validate :validate_product_availability

  after_create :update_storage

  def validate_product_availability
    if quantity > available_quantity
      errors.add(:quantity, "is greater than the available quantity")
    end
    # sale.update(status: 2)
  end

  def available_quantity
    Storage.where(store_id: sale.store_id, product_id: product_id).sum(:quantity)
  end


  after_create :update_status

  def update_status
    if sale_product.errors.empty?
      sale.update(status: 2)
    else
      sale.update(status: 3)
    end
  end

  # after_create :set_total_amount

  # def set_total_amount
  #   total = 0
  #   sale_products.each do |sale_product|
  #     total += sale_product.quantity * sale_product.product.unit_price.to_f
  #   end
  #   sale.update(total_amount: total)
  # end

  def update_storage
    storage = Storage.find_by(store_id: sale.store_id, product_id: product_id)
    if storage.present?
      storage.update(quantity: storage.quantity - quantity)
    end
  end
end