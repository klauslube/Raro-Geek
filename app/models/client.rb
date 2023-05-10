# frozen_string_literal: true

class Client < ApplicationRecord
  belongs_to :address

  has_many :sales, dependent: :destroy
end
