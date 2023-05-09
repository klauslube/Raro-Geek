# frozen_string_literal: true

class Supplier < ApplicationRecord
  belongs_to :address
  has_many :product_suppliers, dependent: :destroy
  has_many :products, through: :product_suppliers

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :CNPJ, presence: true, length: { maximum: 20 }, uniqueness: true
end
