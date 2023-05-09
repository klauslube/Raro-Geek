# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true, optional: true

  validates :name, :city, :neighborhood, :public_place, length: { maximum: 255 }
  validates :name, :city, :zip_code, :public_place, :number, :neighborhood, presence: true
  validates :zip_code, length: { is: 8 }
  validates :number, length: { minimum: 1, maximum: 15 }

  # accepts_nested_attributes_for :addressable
end
