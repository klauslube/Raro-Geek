# frozen_string_literal: true

class Client < ApplicationRecord
  belongs_to :address
  
  has_many :sales, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :CPF, presence: true, length: { maximum: 15 }, uniqueness: true

  accepts_nested_attributes_for :address
end

