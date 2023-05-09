# frozen_string_literal: true

class Storage < ApplicationRecord
  belongs_to :product
  belongs_to :store
end
