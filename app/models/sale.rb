# frozen_string_literal: true

class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :store

  has_many :sale_products, dependent: :destroy
  has_many :products, through: :sale_products

  enum :status, {
    pending_payment: 1,
    paid: 2,
    cancelled: 3
  }, scopes: true, default: :pending_payment

  validates :status, presence: { in: %i[pending_payment paid cancelled] }
  validates :fiscal_number, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :total_amount, presence: true, numericality: { greater_than: 0 }

end
