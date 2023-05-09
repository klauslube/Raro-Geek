# frozen_string_literal: true

class SaleProduct < ApplicationRecord
  belongs_to :sale
  belongs_to :product

  validates :quantity, presence: true
end
