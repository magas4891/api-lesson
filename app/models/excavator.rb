# frozen_string_literal: true

class Excavator < ApplicationRecord
  # serialize :address, JSON
  alias_attribute(:Excavator, :excavator)
  belongs_to :ticket
end
