# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :storages, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_many :product_suppliers, dependent: :destroy
  has_many :suppliers, through: :product_suppliers

  validates :name, presence: true, length: { maximum: 255 }
  validates :unit_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true
end
