# frozen_string_literal: true

class Storage < ApplicationRecord
  belongs_to :product
  belongs_to :store

  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true, minimum: 0 }
  validates :store, uniqueness: true

  scope :available_quantity, -> (sale_product, prod){where(store: sale_product.sale.store, product: prod ).sum(:quantity)}
end
