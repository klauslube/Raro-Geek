# frozen_string_literal: true

class Supplier < ApplicationRecord
  belongs_to :address
  has_many :product_suppliers, dependent: :destroy
  has_many :products, through: :product_suppliers

  validates :name, presence: true, length: { maximum: 255 }
  validates :CNPJ, presence: true, length: { minimum: 10, maximum: 20 }, uniqueness: true

  scope :by_city, ->(city) { joins(:address).where(addresses: { city: }) }
  scope :by_cnpj, ->(cnpj) { where(CNPJ: cnpj) }
  scope :with_products, -> { joins(:products).distinct }
end
