class Product < ApplicationRecord
  has_many :storages, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_many :product_suppliers, dependent: :destroy
  has_many :suppliers, through: :product_suppliers
end
