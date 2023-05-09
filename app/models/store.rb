# frozen_string_literal: true

class Store < ApplicationRecord
  has_many :storages, dependent: :destroy
  has_many :sales
  has_many :products, through: :storages
end
