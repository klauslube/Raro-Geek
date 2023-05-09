# frozen_string_literal: true

class Store < ApplicationRecord
  belongs_to :address
  has_many :storages, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_many :products, through: :storages
  # has_one :address, as: :addressable, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :CNPJ, presence: true, length: { maximum: 20 }, uniqueness: true
end
