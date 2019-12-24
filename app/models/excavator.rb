class Excavator < ApplicationRecord
  serialize :address, JSON
  belongs_to :ticket
end
