# frozen_string_literal: true

class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :store

  has_many :sale_products, dependent: :destroy
  has_many :products, through: :sale_products

  validates :finished, inclusion: [true, false]
  validates :fiscal_number, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :total_amount, presence: true, numericality: { greater_than: 0 }

  scope :finished, -> { where(finished: true) }
  scope :not_finished, -> { where(finished: false) }
  scope :by_fiscal_number, ->(number) { where(fiscal_number: number) }
  scope :by_client, ->(client) { where(client_id: client.id) }
end
