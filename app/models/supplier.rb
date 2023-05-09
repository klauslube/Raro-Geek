class Supplier < ApplicationRecord
  belongs_to :address
  has_many :product_suppliers
  has_many :products, through: :product_suppliers
end
