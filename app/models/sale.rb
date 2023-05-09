class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :store

  has_many :sale_products, dependent: :destroy
  has_many :products, through: :sale_products


  enum :status, {
    pending_payment: 1,
    paid: 2,
    overdue: 3,
    cancelled: 4  
  }, scopes: true, default: :pending_payment
end
