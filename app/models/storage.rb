# frozen_string_literal: true

class Storage < ApplicationRecord
  belongs_to :product
  belongs_to :store, optional: false

  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true, minimum: 0 }

  scope :available_quantity, lambda { |sale_product, prod|
                               where(store: sale_product.sale.store, product: prod).sum(:quantity)
                             }
end
