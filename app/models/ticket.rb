# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_one :excavator
  validates_associated :excavator
  validates :RequestNumber, :SequenceNumber, :RequestType,
            :DateTimes, :ServiceArea, :ExcavationInfo, presence: true

  alias_attribute(:RequestNumber, :request_number)
  alias_attribute(:SequenceNumber, :sequence_number)
  alias_attribute(:RequestType, :request_type)
  alias_attribute(:DateTimes, :date_times)
  alias_attribute(:ServiceArea, :service_area)
  alias_attribute(:ExcavationInfo, :digsite_info)

  accepts_nested_attributes_for :excavator
end
