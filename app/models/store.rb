# frozen_string_literal: true

class Store < ApplicationRecord
  belongs_to :address
  has_many :storages, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_many :products, through: :storages

  validates :name, presence: true, length: { maximum: 255 }
  validates :CNPJ, presence: true, length: { maximum: 20 }, uniqueness: true

  accepts_nested_attributes_for :address
end
