# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true, optional: true
end
