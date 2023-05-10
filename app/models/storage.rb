# frozen_string_literal: true

class Storage < ApplicationRecord
  belongs_to :product
  belongs_to :store

  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true, minimum: 0 }
end
