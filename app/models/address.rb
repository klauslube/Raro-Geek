# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true, optional: true

  validates :street, :city, :neighborhood, :public_place, length: { maximum: 255 }
  validates :street, :city, :zip_code, :public_place, :number, :neighborhood, presence: true
  validates :zip_code, length: { is: 8 }
  validates :number, length: { minimum: 1, maximum: 15 }

  accepts_nested_attributes_for :addressable

  scope :by_city, ->(city) { where(city:) }
  scope :by_zip_code, ->(zip_code) { where(zip_code:) }
end
