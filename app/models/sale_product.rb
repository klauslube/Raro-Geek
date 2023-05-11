# frozen_string_literal: true

class SaleProduct < ApplicationRecord
  belongs_to :sale
  belongs_to :product

  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true, minimum: 1 }
  
  validate :validate_product_availability
  after_create :update_storage
  
  def validate_product_availability
    return unless quantity > Storage.available_quantity(self, product)
    
    errors.add(:quantity, 'is greater than the available quantity')
  end
  
  def update_storage
    storage = Storage.find_by(store_id: sale.store_id, product_id: product_id)
    return if storage.blank?

    sale.update(finished: true)
    storage.update(quantity: storage.quantity - quantity)
  end
