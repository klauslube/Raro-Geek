# frozen_string_literal: true

class SaleProduct < ApplicationRecord
  belongs_to :sale
  belongs_to :product

  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true, minimum: 1 }
end
