# frozen_string_literal: true

class Excavator < ApplicationRecord
  # serialize :address, JSON
  belongs_to :ticket

  alias_attribute(:Excavator, :excavator)
end
