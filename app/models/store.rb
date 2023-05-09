class Store < ApplicationRecord
  has_many :storages
  has_many :sales
  has_many :products, through: :storages
end