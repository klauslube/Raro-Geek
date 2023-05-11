# frozen_string_literal: true

class Client < ApplicationRecord
  belongs_to :address

  has_many :sales, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :CPF, presence: true, length: { maximum: 15 }, uniqueness: true

  scope :by_name, ->(name) { where('name ILIKE ?', "%#{name}%") }
  scope :by_cpf, ->(cpf) { where(cpf:) }
  scope :by_city, ->(city_name) { joins(:address).where(addresses: { city: city_name }) }

  scope :with_sales, -> { joins(:sales).distinct }
end
