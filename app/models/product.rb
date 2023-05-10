# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :storages, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_many :product_suppliers, dependent: :destroy
  has_many :suppliers, through: :product_suppliers
  has_many :stores, through: :storages

  validates :name, presence: true, length: { maximum: 255 }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
end
