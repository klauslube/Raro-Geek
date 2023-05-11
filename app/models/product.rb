# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :storages, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_many :product_suppliers, dependent: :destroy
  has_many :suppliers, through: :product_suppliers
  has_many :stores, through: :storages
  has_many :sale_products

  validates :name, presence: true, length: { maximum: 255 }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true

  scope :available_in_store, ->(store_id) { joins(:storages).where(storages: { store_id: }) }
  scope :product_alphabetical_order, -> { order(name: :asc) }
end
