# frozen_string_literal: true

class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :store

  has_many :sale_products, dependent: :destroy
  has_many :products, through: :sale_products

  validates :finished, inclusion: [true, false]
  validates :fiscal_number, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :total_amount, presence: true, numericality: { greater_than: 0 }

  # after_validation :update_status

  # def update_status
  #   if sale_products.errors.empty?
  #     update(status: 2)
  #   else
  #     update(status: 3)
  #   end
  # end

  # after_save :update_storage

  # def update_storage
  #   sale_products.each do |sale_product|
  #     storage = Storage.find_by(store_id: store_id, product_id: sale_product.product_id)
  #     storage.update(quantity: storage.quantity - sale_product.quantity) if storage.present?
  #   end
  # end
end
